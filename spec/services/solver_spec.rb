require "rails_helper"
require "json"

RSpec.describe Solver do
  # let(:word_json) {
  #   "[{\"id\":2,\"word\":\"AALII\",\"l0\":\"A\",\"l1\":\"A\",\"l2\":\"L\",\"l3\":\"I\",\"clue\":\"noun - a small Hawaiian tree with hard dark wood  \",\"created_at\":\"2018-08-08T01:32:42.597Z\",\"updated_at\":\"2018-08-08T01:32:42.597Z\",\"l4\":\"I\"},{\"id\":272,\"word\":\"ALIGN\",\"l0\":\"A\",\"l1\":\"L\",\"l2\":\"I\",\"l3\":\"G\",\"clue\":\"verb - align oneself with a group or a way of thinking  be or come into adjustment with  place in a line or arrange so as to be parallel or straight; \\\"align the car with the curb\\\"; \\\"align the sheets of paper on the table\\\"  bring (components or parts) into proper or desirable coordination correlation; \\\"align the wheels of my car\\\"; \\\"ordinate similar parts\\\"  \",\"created_at\":\"2018-08-08T01:32:50.156Z\",\"updated_at\":\"2018-08-08T01:32:50.156Z\",\"l4\":\"N\"},{\"id\":1070,\"word\":\"BLICE\",\"l0\":\"B\",\"l1\":\"L\",\"l2\":\"I\",\"l3\":\"C\",\"clue\":\"noun - a top worn by women  \",\"created_at\":\"2018-08-08T01:33:14.987Z\",\"updated_at\":\"2018-08-08T01:33:14.987Z\",\"l4\":\"E\"},{\"id\":2814,\"word\":\"EIGER\",\"l0\":\"E\",\"l1\":\"I\",\"l2\":\"G\",\"l3\":\"E\",\"clue\":\"unknown - Mountain in the Bernese Alps\",\"created_at\":\"2018-08-08T01:34:04.625Z\",\"updated_at\":\"2018-08-08T01:34:04.625Z\",\"l4\":\"R\"},{\"id\":4068,\"word\":\"HAART\",\"l0\":\"H\",\"l1\":\"A\",\"l2\":\"A\",\"l3\":\"R\",\"clue\":\"noun - a combination of protease inhibitors taken with reverse transcriptase inhibitors; used in treating AIDS and HIV  \",\"created_at\":\"2018-08-08T01:34:41.405Z\",\"updated_at\":\"2018-08-08T01:34:41.405Z\",\"l4\":\"T\"},{\"id\":4069,\"word\":\"HABER\",\"l0\":\"H\",\"l1\":\"A\",\"l2\":\"B\",\"l3\":\"E\",\"clue\":\"noun - German chemist noted for the synthetic production of ammonia from the nitrogen in air (1868-1934)  \",\"created_at\":\"2018-08-08T01:34:41.407Z\",\"updated_at\":\"2018-08-08T01:34:41.407Z\",\"l4\":\"R\"},{\"id\":7805,\"word\":\"RICED\",\"l0\":\"R\",\"l1\":\"I\",\"l2\":\"C\",\"l3\":\"E\",\"clue\":\"verb - sieve so that it becomes the consistency of rice; \\\"rice the potatoes\\\"  \",\"created_at\":\"2018-08-08T01:36:43.120Z\",\"updated_at\":\"2018-08-08T01:36:43.120Z\",\"l4\":\"D\"},{\"id\":7837,\"word\":\"RINDS\",\"l0\":\"R\",\"l1\":\"I\",\"l2\":\"N\",\"l3\":\"D\",\"clue\":\"noun - the natural outer covering of food (usually removed before eating)  \",\"created_at\":\"2018-08-08T01:36:44.118Z\",\"updated_at\":\"2018-08-08T01:36:44.118Z\",\"l4\":\"S\"},{\"id\":9722,\"word\":\"TIRES\",\"l0\":\"T\",\"l1\":\"I\",\"l2\":\"R\",\"l3\":\"E\",\"clue\":\"verb - exhaust or get tired through overuse or great strain or stress; \\\"We wore ourselves out on this hike\\\"  lose interest or become bored with something or somebody; \\\"I'm so tired of your mother and her complaints about my food\\\"  cause to be bored  deplete; \\\"exhaust one's savings\\\"; \\\"We quickly played out our strength\\\"  hoop that covers a wheel; \\\"automobile tires are usually made of rubber and filled with compressed air\\\"  \",\"created_at\":\"2018-08-08T01:37:47.390Z\",\"updated_at\":\"2018-08-08T01:37:47.390Z\",\"l4\":\"S\"}]"
  # }
  #
  # before(:each) do
  #   JSON.parse(word_json).each { |word| FiveLetterWord.create(word) }
  # end

  let(:params) { { letter: "h", number: "1"} }

  it 'returns the first found array of answers and words' do
    expect(Solver.new(params).call[0][0]).to eq ["HAART", "HABER", "AALII", "BLICE", "EIGER", "RINDS"]
  end
end
