class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  
  get '/recipes/new' do 
    @recipes = Recipe.new(name: params[:name], ingredients: params[:ingredient], cook_time: params[:cook_time])
    @recipes.save
    erb :new 
  end  
  
  get '/recipes/:id' do 
    @recipes = Recipe.find_by_id(params[:id])
    erb :show 
  end 
  
  get '/recipes/:id/edit' do
    @recipes = Recipe.find_by_id(params[:id])
    erb :edit 
  end  
  
  patch '/recipes/:id' do 
    @recipes = Recipe.find_by_id(params[:id])
    @recipes.name = params[:name]
    @recipes.ingredients = params[:ingredients]
    @recipes.cook_time = params[:cook_time]
    @recipes.save
    redirect '/show'
    end  
    
    delete '/recipes/:id/delete' do
      @recipes = Recipe.find_by_id(params[:id])
      @recipes.delete 
      redirect '/index'
    end  
    
    
end