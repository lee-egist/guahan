class CreateOrigins < ActiveRecord::Migration
  def change
    create_table :origins do |t|
      t.references :word, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true, default: 1
      t.text :story
      t.integer :endorsements, default: 0

      t.timestamps null: false
    end
  end
end
