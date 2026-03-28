class RoutineExercisesController < ApplicationController
  before_action :set_routine

  def create
    position = @routine.routine_exercises.count + 1
    @routine_exercise = @routine.routine_exercises.new(routine_exercise_params.merge(position: position))
    if @routine_exercise.save
      redirect_to @routine, notice: "Exercise added."
    else
      redirect_to @routine, alert: "Could not add exercise."
    end
  end

  def update
    @routine_exercise = @routine.routine_exercises.find(params[:id])
    if @routine_exercise.update(routine_exercise_params)
      redirect_to @routine, notice: "Exercise updated."
    else
      redirect_to @routine, alert: "Could not update exercise."
    end
  end

  def destroy
    @routine_exercise = @routine.routine_exercises.find(params[:id])
    @routine_exercise.destroy
    # Reorder remaining positions
    @routine.routine_exercises.order(:position).each_with_index do |re, i|
      re.update_column(:position, i + 1)
    end
    redirect_to @routine, notice: "Exercise removed."
  end

  private

  def set_routine
    @routine = Current.user.routines.find(params[:routine_id])
  end

  def routine_exercise_params
    params.expect(routine_exercise: [ :exercise_id, :target_sets, :target_reps, :notes ])
  end
end
