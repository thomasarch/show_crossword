class AddLetterToFiveLetterWords < ActiveRecord::Migration[5.2]
  def change
    add_column :five_letter_words, :l4, :string
  end
end
