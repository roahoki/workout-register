class RoutinesController < ApplicationController
  before_action :set_routine, only: [ :show, :edit, :update, :destroy ]

  def index
    @routines = Current.user.routines.includes(:exercises)
  end

  def show
    @exercises = Exercise.ordered
    @routine_exercise = RoutineExercise.new
  end

  def new
    @routine = Current.user.routines.new
  end

  def create
    @routine = Current.user.routines.new(routine_params)
    if @routine.save
      redirect_to @routine, notice: "Routine created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @routine.update(routine_params)
      redirect_to @routine, notice: "Routine updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @routine.destroy
    redirect_to routines_path, notice: "Routine deleted."
  end

  private

  def set_routine
    @routine = Current.user.routines.find(params[:id])
  end

  def routine_params
    params.expect(routine: [ :name, :description ])
  end
end
