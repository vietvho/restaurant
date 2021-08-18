class AddCategoriesToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :categories, :string,  array:true
  end
end
