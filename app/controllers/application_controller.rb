
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @title = params[:title]
    @content = params[:content]
    Article.create(title: @title, content: @content)
    erb :show
  end 

  get '/articles' do 
    @articles = Article.all 
    erb :index
  end

  get '/articles/:id' do
    @id = params[:id]
    @article = Article.all.find(@id)
    erb :show
  end

  get '/articles/:id/edit' do
    @id = params[:id]
    erb :edit
  end

  post '/articles/:id' do
    @title = params[:title]
    @content = params[:content]
    article = Article.find(params[:id])
    article.update(title: @title, content: @content)
    
  end
end
