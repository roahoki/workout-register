class WorkoutSessionsController < ApplicationController
  before_action :set_session, only: [ :show, :complete, :destroy ]

  def index
    @sessions = Current.user.workout_sessions.recent.includes(:routine, :workout_sets)
  end

  def show
    @exercises_with_sets = @workout_session.routine&.routine_exercises&.includes(:exercise) || []
    @sets_by_exercise = @workout_session.workout_sets.group_by(&:exercise_id)
  end

  def new
    @routines = Current.user.routines.includes(:exercises)
  end

  def create
    @workout_session = Current.user.workout_sessions.new(workout_session_params)
    if @workout_session.save
      redirect_to @workout_session, notice: "Workout started. Let's go!"
    else
      @routines = Current.user.routines.includes(:exercises)
      render :new, status: :unprocessable_entity
    end
  end

  def complete
    @workout_session.complete!
    redirect_to workout_sessions_path, notice: "Workout completed. Great work!"
  end

  def destroy
    @workout_session.destroy
    redirect_to workout_sessions_path, notice: "Session deleted."
  end

  private

  def set_session
    @workout_session = Current.user.workout_sessions.find(params[:id])
  end

  def workout_session_params
    params.expect(workout_session: [ :routine_id, :notes ])
  end
end
