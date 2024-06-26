# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :current_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    @question = current_test_question
  end

  def new
    @question = current_test_questions.build
  end

  def edit
    @question = current_test_question
  end

  def create
    @question = current_test_questions.build(questions_params)

    if @question.save
      redirect_to(test_question_url(@current_test, @question),
                  notice: 'Question was successfully created.')
    else
      render :new
    end
  end

  def update
    @question = current_test_question

    if @question.update(questions_params)
      redirect_to(test_question_url(@current_test, @question), notice: 'Question was successfully updated.')
    else
      render :edit
    end
  end

  def destroy
    current_test_question.destroy
    redirect_to(test_questions_path(@current_test), notice: 'Question was successfully deleted.')
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

  def current_test
    @current_test ||= Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
