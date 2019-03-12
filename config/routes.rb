Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dashboard#display_main_screen"
  get 'display_main_screen' => 'dashboard#display_main_screen'

  get 'return_data/:start_date/:end_date(.:format)' => 'dashboard#return_data'
  get 'return_sample_data/:start_date/:end_date(.:format)' => 'dashboard#return_sample_data'

  get 'display_upload_screen' => 'dashboard#display_upload_screen'
  get 'display_simulator' => 'dashboard#display_simulator'
  put 'upload_data' => 'dashboard#upload_data'
  post 'upload_data' => 'dashboard#upload_data'
  post 'upload_data_rest' => 'dashboard#upload_data_rest'
  get 'reset_data' => 'dashboard#reset_data'
  get 'completely_clear_data' => 'dashboard#completely_clear_data'

  get 'return_sample_images/:sn(.:format)' => "dashboard#return_sample_images"

end
