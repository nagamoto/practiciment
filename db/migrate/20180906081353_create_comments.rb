class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :status, null: false, default: 0
      t.datetime :deleted_at
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
