class ExercisesController < ApplicationController
  before_action :set_exercise, only: [ :show, :edit, :update, :destroy ]
  before_action :require_ownership, only: [ :edit, :update, :destroy ]

  def index
    @exercises_by_group = Exercise.for_user(Current.user).ordered.group_by(&:muscle_group)
  end

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Current.user.exercises.build(exercise_params)
    if @exercise.save
      redirect_to exercises_path, notice: "Exercise added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to exercises_path, notice: "Exercise updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise.destroy
    redirect_to exercises_path, notice: "Exercise deleted."
  end

  private

  def set_exercise
    @exercise = Exercise.for_user(Current.user).find(params[:id])
  end

  def require_ownership
    unless @exercise.user_id == Current.user.id
      redirect_to exercises_path, alert: "You can only edit your own exercises."
    end
  end

  def exercise_params
    params.expect(exercise: [ :name, :muscle_group, :description ])
  end
end
