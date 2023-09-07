require "sidekiq/web"
Rails.application.routes.draw do
	get 'welcome/index'
	
	resources :articles
	
	root 'welcome#index'

        match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]

        mount Sidekiq::Web => "sidekiq"

        mount Cloud66Metrics::Engine => "/cloud66"
end
