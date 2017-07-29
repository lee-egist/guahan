class CreatePronunciations < ActiveRecord::Migration
  def change
    create_table :pronunciations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :word, index: true, foreign_key: true
      t.string :phonetic
      t.string :vocal
      t.integer :verified, default: 0

      t.timestamps null: false
    end
  end
end
