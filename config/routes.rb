Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dashboard#display_main_screen"
  get 'display_main_screen' => 'dashboard#display_main_screen'
  get 'display_select_weed_screen' => 'dashboard#display_select_weed_screen'
  get 'display_statistics_screen' => 'dashboard#display_statistics_screen'

  get 'return_data/:start_date/:end_date' => 'dashboard#return_data'
  get 'return_sample_data/:start_date/:end_date(.:format)' => 'dashboard#return_sample_data'

end
