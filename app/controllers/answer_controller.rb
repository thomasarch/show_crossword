class AnswerController < ApplicationController
  def show
    @answers, @words = Solver.new(params).call
  end
end
