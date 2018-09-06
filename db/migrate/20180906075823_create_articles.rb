class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.integer :status
      t.datetime :posted_at
      t.datetime :archived_at
      t.datetime :deleted_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
