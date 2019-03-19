require 'rails_helper'
require 'json'

RSpec.describe Solver do
  let(:params) { { letter: 'h', number: 'r' } }

  it 'validates words in a randomly generated square' do
    answer = Solver.new(params).call[0][0]
    binding.irb
    answer.delete_at(1)

    down_list = {}
    answer[0].split('').each_with_index do |letter, i|
      down_list[i] = letter
      4.times do |count|
        count += 1
        down_list[i].concat(answer[count][i])
      end
    end

    down_list.each do |_k, v|
      expect(FiveLetterWord.where(word: v).count).to eq(1)
    end
  end
end
