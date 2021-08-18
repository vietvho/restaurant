class AddPictureToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :picture, :string
  end
end
