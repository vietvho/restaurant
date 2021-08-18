class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :body
      t.text :title
      t.text :price

      t.timestamps
    end
  end
end
