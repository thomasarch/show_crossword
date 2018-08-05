class CreateSplitWords < ActiveRecord::Migration[5.2]
  def change
    create_table :split_words do |t|
      t.string :word
      t.string :l0
      t.string :l1
      t.string :l2
      t.string :l3
      t.string :l4
      t.string :l5
      t.string :l6
      t.string :l7
      t.string :l8
      t.string :l9

      t.timestamps
    end
  end
end
