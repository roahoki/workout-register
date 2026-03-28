class WorkoutSetsController < ApplicationController
  before_action :set_workout_session

  def create
    @workout_set = @workout_session.workout_sets.new(workout_set_params)
    if @workout_set.save
      @exercise = @workout_set.exercise
      @logged_sets = @workout_session.workout_sets.where(exercise: @exercise).order(:set_number)
      @routine_exercise = @workout_session.routine&.routine_exercises&.find_by(exercise: @exercise)
      @total_sets_logged = @workout_session.workout_sets.count
      @total_sets_target = @workout_session.routine&.routine_exercises&.sum(:target_sets) || 0

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @workout_session }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("flash", partial: "shared/flash", locals: { alert: "Could not log set." }) }
        format.html { redirect_to @workout_session, alert: "Could not log set." }
      end
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
