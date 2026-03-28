class ExercisesController < ApplicationController
  def index
    @exercises_by_group = Exercise.ordered.group_by(&:muscle_group)
  end

  def show
    @exercise = Exercise.find(params[:id])
  end
end
