Rails.application.routes.draw do
    root "games#index"

    get "games", to: "games#index"
    get "games/:id", to: "games#show", as: "game"
    
    get "register", to: "users#new"
    post "register", to: "users#create"
    get "user", to: "users#show", as: "current_user"
    # get "user/edit", to: "users#edit"
    # post "user/edit", to: "users#update"

    get "login", to: "logins#new"
    post "login", to: "logins#create"
    delete "logout", to: "logins#destroy"
end
