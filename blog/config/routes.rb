Rails.application.routes.draw do
  root 'entries#index'
  resources :entries

  get '/login' => 'session#new'

  post '/session' => 'session#create'

  get '/secret' => 'secret#show'

# Decide on where you want your admin to go, You can have a folder for the non-admins to view the blog post
# this will be static with zero CRUD capabilities

# Build a secret folder and this will have the admin stuff
# Notice that your /secret leads to the entries/show page. This is targeting your show.html.erb inside of 
# your entries folder. It will cause issues because the data is not syncing up. Think about how you want 
# to organize your erbs 

end
