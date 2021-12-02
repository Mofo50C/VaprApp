Rails.application.routes.draw do
    root "games#index"

    get "games", to: "games#index"
    get "games/:id", to: "games#show", as: "game"
    
    get "register", to: "users#new"
    post "register", to: "users#create"
    get "user", to: "users#show", as: "current_user"

    get "login", to: "logins#new"
    post "login", to: "logins#create"
    delete "logout", to: "logins#destroy"

    get "cart", to: "carts#show", as: "current_cart"
    post "cart/add/:id", to: "carts#create", as: "add_cart"
    patch "cart/remove/:id", to: "carts#update", as: "remove_cart"

    get "user/order_history", to: "orders#index", as: "orders"
    get "checkout", to: "orders#new"
    post "checkout", to: "orders#create"

    get "contact", to: "contact#new"
    post "contact", to: "contact#create"

end
