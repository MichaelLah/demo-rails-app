class CreateFastArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :fast_articles, id: false do |t|
      t.string :id, primary_key: true, null: false, limit: 36
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
