
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/new' do

  erb :new
  end

  post '/articles' do
    @title = params[:Title]
    @content = params[:Content]
    @article = Article.create(:title => @title, :content => @content)
    erb :show
  end

  get '/articles/:id' do
    id_number = params[:id]
    @article = Article.find_by_id(id_number)
    erb :show
  end

  get '/articles/:id/edit' do
    id_number = params[:id]
    @article = Article.find_by_id(id_number)
    erb :edit
  end

  put '/articles/:id' do
    binding.pry
    @article = Article.find(params[:id])
    @article.update(title: params[:title], 
                  content: params[:content])

    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.delete
    redirect "/articles"
  end

end
