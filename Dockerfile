FROM ubuntu:20.04
MAINTAINER hello@cloud66.com

ENV NODE_ENV production
ENV RAILS_ENV production

# NOTE: Uncomment to run as non-root user (part #1)
#ENV USER_NAME user
#ENV USER_ID 2917
#RUN addgroup --gid $USER_ID $USER_NAME
#RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $USER_ID $USER_NAME

RUN apt-get update -y && \
    apt-get install -y software-properties-common curl && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-add-repository ppa:git-core/ppa && \
    apt-get update -y && \
    apt-get install -y git wget build-essential libmysqlclient-dev ruby-mysql2 && \
    apt-get install -y --no-install-recommends nodejs yarn

RUN wget https://s3.amazonaws.com/downloads.cloud66.com/ruby/binaries/ubuntu/20.04/x86_64/ruby-2.7.4.tar.bz2 && \
    mkdir -p /usr/local/build && \
    tar -xjvf ruby-2.7.4.tar.bz2 -C /usr/local/build && \
    cp -r --remove-destination /usr/local/build/ruby-2.7.4/* /usr/local

ENV PATH=${PATH}:/usr/local/bin
ENV INSTALL_PATH /app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

# install gems
ARG GITHUB_TOKEN="$GITHUB_TOKEN"
COPY git_config /tmp/git_config
ARG GIT_CONFIG_GLOBAL=/tmp/git_config
ARG GIT_CONFIG_SYSTEM=/tmp/git_config
COPY Gemfile* $INSTALL_PATH/
RUN bundle install --without development test

# install yarn packages
COPY package.json yarn.lock $INSTALL_PATH/
RUN yarn install --check-files
RUN mv $INSTALL_PATH/node_modules /tmp/node_modules

# copy all code over
COPY . $INSTALL_PATH
RUN rm -rf $INSTALL_PATH/node_modules
RUN mv /tmp/node_modules $INSTALL_PATH/node_modules

# NOTE: Uncomment to run as non-root user (part #2)
#RUN chown -R $USER_NAME:$USER_NAME $INSTALL_PATH
#USER $USER_ID

#RUN rails webpacker:install
RUN SECRET_KEY_BASE=`RAILS_ENV=development bin/rake secret` bin/rails assets:precompile
CMD bundle exec rails s -b 0.0.0.0
