require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  	erb :index
  end

  get '/recipes' do
  	@recipes = Recipe.all
  	# binding.pry
  	erb :index
  end

  get '/recipes/new' do
  	erb :new
  end

  post '/recipes' do
  	new_recipe = Recipe.create params
  	redirect "/recipes/#{new_recipe.id}"
  end

  get '/recipes/:id' do
  	@recipe_by_id = Recipe.find params[:id]
  	erb :show
  end

  get '/recipes/:id/edit' do
  	@recipe = Recipe.find params[:id]
  	erb :edit
  end

  patch '/recipes/:id' do
  	recipe = Recipe.find params[:id]
  	recipe.update params.except(:_method)
  	redirect "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id' do
  	recipe = Recipe.find params[:id]
  	recipe.destroy
  	redirect '/recipes'
  end

end
