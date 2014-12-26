Rails.application.routes.draw do
  match '*path', 
    :via => :options,
    :controller => 'welcome', 
    :action => 'options_for_mopd', 
    :conditions => {:method => :options}

  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'welcome#index'

  scope :api do
    post 'drop' => 'new#new'
  end

end
