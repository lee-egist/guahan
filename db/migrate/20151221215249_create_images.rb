  class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :word, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :image_url
      t.integer :verified, default: 0

      t.timestamps null: false
    end
  end
end
