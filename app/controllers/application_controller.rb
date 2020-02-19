
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/articles/new' do 
    erb :new
  end

  post '/articles' do 
    @title = params[:title]
    @content = params[:content]
    new_article = Article.find_or_create_by(title: @title, content: @content)
    redirect "/articles/#{new_article.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  delete "/articles/:id" do
    Article.find(params[:id]).delete
    redirect "/"
  end

  patch '/articles/:id' do 
    puts params
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end
end
