class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles, id: false do |t|
      t.string :id, primary_key: true, null: false
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
