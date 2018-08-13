class AnswerController < ApplicationController
  def show
    @answers, @words = Solver.new.call(params)
  end
end
