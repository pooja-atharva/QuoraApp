class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    @answers = current_user.answers.all
  end

  def show
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def edit
  end

  def create
    @answer = current_user.answers.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer.question, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to  @answer.question, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question = @answer.question
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to @question, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:name, :user_id, :question_id)
    end
end
