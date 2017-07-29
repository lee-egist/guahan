class CreateAlphabets < ActiveRecord::Migration
  def change
    create_table :alphabets do |t|
      t.string :letter, limit: 2
      t.string :pronunciation

      t.timestamps null: false
    end
  end
end
