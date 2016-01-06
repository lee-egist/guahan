class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.references :user, index: true, foreign_key: true, default: 1
      t.references :word, index: true, foreign_key: true
      t.text :explaination

      t.timestamps null: false
    end
  end
end