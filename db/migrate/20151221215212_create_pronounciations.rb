class CreatePronounciations < ActiveRecord::Migration
  def change
    create_table :pronounciations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :word, index: true, foreign_key: true
      t.string :phonetic
      t.string :vocal

      t.timestamps null: false
    end
  end
end
