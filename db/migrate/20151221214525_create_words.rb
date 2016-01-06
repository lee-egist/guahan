class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.references :alphabet, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true, default: 1
      t.string :spelling


      t.timestamps null: false
    end
  end
end
