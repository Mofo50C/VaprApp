Rails.application.routes.draw do
    root "games#index"

    get "games", to: "games#index"
    get "games/:id", to: "games#show", as: "game"
    
    get "register", to: "users#new"
    post "register", to: "users#create"
    get "user", to: "users#show", as: "current_user"
    # get "user/edit", to: "users#edit"
    # patch "user/edit", to: "users#update"

    get "login", to: "logins#new"
    post "login", to: "logins#create"
    delete "logout", to: "logins#destroy"

    get "cart", to: "carts#show", as: "current_cart"
    post "add_cart/:id", to: "carts#create", as: "add_cart"
    patch "remove_cart/:id", to: "carts#update", as: "remove_cart"
end
