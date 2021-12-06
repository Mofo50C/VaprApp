Rails.application.routes.draw do
    root "games#index"

    get "games", to: "games#index"
    get "games/:id", to: "games#show", as: "game"
    
    get "register", to: "users#new"
    post "register", to: "users#create"

    get "login", to: "logins#new"
    post "login", to: "logins#create"
    delete "logout", to: "logins#destroy"

    get "cart", to: "cart#show", as: "current_cart"
    post "cart/add/:id", to: "cart#create", as: "add_cart"
    patch "cart/remove/:id", to: "cart#update", as: "remove_cart"

    get "user/order_history", to: "orders#index", as: "orders"
    get "checkout", to: "orders#new"
    post "checkout", to: "orders#create"

    get "contact", to: "contact#new"
    post "contact", to: "contact#create"
end