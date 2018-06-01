"""
Nested Resources
"""

MyApp::Application.routes.draw do
  resources :album do
    resources :songs
    
end