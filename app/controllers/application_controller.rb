
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

  put '/articles/:id/edit' do
    title = params[:title]
    content = params[:content]
    @article.title = title
    @article.content = content

    redirect "articles/:id"
  end


end
