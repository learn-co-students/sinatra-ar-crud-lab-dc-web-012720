#Placeholder for a model

class Article < ActiveRecord::Base
    def article_array
        Article.all.map { |x| x.title[0] }
    end
end