# == Route Map
#
# Prefix Verb URI Pattern Controller#Action
#   root GET  /           home#index
#

Rails.application.routes.draw do
  root to: "home#index"
end
