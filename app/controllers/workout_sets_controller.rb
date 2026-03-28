class WorkoutSetsController < ApplicationController
  before_action :set_workout_session

  def create
    @workout_set = @workout_session.workout_sets.new(workout_set_params)
    if @workout_set.save
      redirect_to @workout_session, notice: "Set logged."
    else
      redirect_to @workout_session, alert: "Could not log set."
    end
  end

  def update
    @workout_set = @workout_session.workout_sets.find(params[:id])
    @workout_set.update(workout_set_params)
    redirect_to @workout_session
  end

  private

  def set_workout_session
    @workout_session = Current.user.workout_sessions.find(params[:workout_session_id])
  end

  def workout_set_params
    params.expect(workout_set: [ :exercise_id, :set_number, :reps, :weight, :unit, :completed ])
  end
end
