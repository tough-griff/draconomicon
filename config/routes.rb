# == Route Map
#
#                   Prefix Verb   URI Pattern                                   Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                      devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                      devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                     devise/sessions#destroy
#            user_password POST   /users/password(.:format)                     devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                 devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                devise/passwords#edit
#                          PATCH  /users/password(.:format)                     devise/passwords#update
#                          PUT    /users/password(.:format)                     devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                       devise/registrations#cancel
#        user_registration POST   /users(.:format)                              devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                      devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                         devise/registrations#edit
#                          PATCH  /users(.:format)                              devise/registrations#update
#                          PUT    /users(.:format)                              devise/registrations#update
#                          DELETE /users(.:format)                              devise/registrations#destroy
#        user_confirmation POST   /users/confirmation(.:format)                 devise/confirmations#create
#    new_user_confirmation GET    /users/confirmation/new(.:format)             devise/confirmations#new
#                          GET    /users/confirmation(.:format)                 devise/confirmations#show
#              user_unlock POST   /users/unlock(.:format)                       devise/unlocks#create
#          new_user_unlock GET    /users/unlock/new(.:format)                   devise/unlocks#new
#                          GET    /users/unlock(.:format)                       devise/unlocks#show
#          user_characters GET    /users/:user_id/characters(.:format)          characters#index
#                          POST   /users/:user_id/characters(.:format)          characters#create
#       new_user_character GET    /users/:user_id/characters/new(.:format)      characters#new
#      edit_user_character GET    /users/:user_id/characters/:id/edit(.:format) characters#edit
#           user_character GET    /users/:user_id/characters/:id(.:format)      characters#show
#                          PATCH  /users/:user_id/characters/:id(.:format)      characters#update
#                          PUT    /users/:user_id/characters/:id(.:format)      characters#update
#                          DELETE /users/:user_id/characters/:id(.:format)      characters#destroy
#                    users GET    /users(.:format)                              users#index
#                     user GET    /users/:id(.:format)                          users#show
#              sidekiq_web        /sidekiq                                      Sidekiq::Web
#                  pg_hero        /pghero                                       PgHero::Engine
#                     root GET    /                                             home#index
#                     home GET    /home(.:format)                               home#index
#                    about GET    /about(.:format)                              home#about
#                          GET    /*path(.:format)                              application#catchall
#

require "sidekiq/web"
Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i(index show) do
    resources :characters
  end

  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web, at: "/sidekiq"
    mount PgHero::Engine, at: "pghero"
  end

  root to: "home#index"
  get "home", to: "home#index"
  get "about", to: "home#about"
  get "*path", to: "application#catchall"
end
