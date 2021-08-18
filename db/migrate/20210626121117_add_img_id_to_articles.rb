class AddImgIdToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :img_id, :integer
  end
end
