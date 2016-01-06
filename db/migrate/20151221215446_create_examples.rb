class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.references :word, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :written
      t.string :vocal


      t.timestamps null: false
    end
  end
end
