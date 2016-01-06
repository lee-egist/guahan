module ApplicationHelper

  def add_def(word, explanation)
    Definition.create(user_id: 1, word_id: word.id, explaination: explaination)
  end
end
