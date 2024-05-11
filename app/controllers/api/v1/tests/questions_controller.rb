# frozen_string_literal: true

class Api::V1::Tests::QuestionsController < ApplicationController
  before_action :set_current_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = current_test_questions
  end

  def show
    @question = current_test_question
  end

  def new
    @question = current_test_questions.new
  end

  def create
    @question = current_test_questions.build(questions_params)

    if @question.save
      redirect_to(api_v1_test_question_url(@current_test, @question),
                  notice: 'Question was successfully created.')
    else
      render :new
    end
  end

  def destroy
    if current_test_question.destroy
      redirect_to(api_v1_test_questions_path(@current_test), notice: 'Question was successfully deleted.')
    else
      render :show, notice: 'Something went wrong'
    end
  end

  private

  def questions_params
    params.require(:question).permit(:body)
  end

  def current_test_questions
    @current_test.questions
  end

  def current_test_question
    current_test_questions.find(params[:id])
  end

  def set_current_test
    @set_current_test ||= Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
