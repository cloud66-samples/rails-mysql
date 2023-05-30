task :before_assets_precompile do
  # run a command which starts your packaging
  message = "OMFG running asset precompile!!!"
  Rails.logger.info(message)
  puts message
  
  if ENV["FAIL_COMPILATION"] == "true"
    error_message = "HAHAHA OOPSIE FAILIE U NO GET THIS"
    Rails.logger.info(error_message)
    puts error_message
    raise "LOL LMAO"
  end
end

# every time you execute 'rake assets:precompile'
# run 'before_assets_precompile' first    
Rake::Task['assets:precompile'].enhance ['before_assets_precompile']
