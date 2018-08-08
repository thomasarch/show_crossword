class CreateFiveLetterWords < ActiveRecord::Migration[5.2]
  def change
    create_table :five_letter_words do |t|
      t.string :word
      t.string :l0
      t.string :l1
      t.string :l2
      t.string :l3
      t.string :clue

      t.timestamps
    end
  end
end
