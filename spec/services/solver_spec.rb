require "rails_helper"

RSpec.describe Solver do

  before(:all) do
    sqlite3 development.sqlite3 .dump > test.sqlite3
  end

  let(:solver) { Solver.new }
  let(:params) { { letter: "h", number: "2"} }

  it 'returns the first found array of answers and words' do
    expect(solver.call(params)).to eq []
  end
end
