class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :origin, index: true, foreign_key: true
      t.text :opinion
      t.integer :up_votes
      t.integer :down_votes

      t.timestamps null: false
    end
  end
end
