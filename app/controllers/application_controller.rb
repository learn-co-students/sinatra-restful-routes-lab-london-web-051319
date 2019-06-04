class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  get "/recipes/new" do
    erb :new
  end

  post "/recipes" do
    redirect "/recipes/#{Recipe.create(params).id}"
  end

  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @string = "#{@recipe.name} #{@recipe.ingredients} #{@recipe.cook_time} minutes"
    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch "/recipes/:id" do
    Recipe.find(params[:id]).update(params)
    redirect "/recipes/#{params[:id]}"
  end

  delete "/recipes/:id" do
    Recipe.find(params[:id]).destroy
    redirect "/recipes"
  end

end
