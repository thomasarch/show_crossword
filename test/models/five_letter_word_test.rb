# == Schema Information
#
# Table name: five_letter_words
#
#  id         :integer          not null, primary key
#  word       :string
#  l0         :string
#  l1         :string
#  l2         :string
#  l3         :string
#  clue       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  l4         :string
#

require 'test_helper'

class FiveLetterWordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
