# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(handle: "me", email: "admin@thissite.com", password: "just2easy4you")
require_relative "languages"
require_relative "alphabet"
require_relative "set_letters"

json = ActiveSupport::JSON.decode(File.read('db/kimonoData.json'))
json["results"]["collection1"].each do |obj|
  letters = obj["word"]["text"].to_s.downcase.slice!(0,2)
  puts letters
  letter_id = set_letters(letters)
  puts letter_id
  new_word = Word.create(alphabet_id: letter_id , spelling: obj["word"]["text"].to_s, user_id: 1)
   if new_word.save
     Definition.create(user_id: 1, word_id: new_word.id, explaination: obj["definition"])
   end
end
