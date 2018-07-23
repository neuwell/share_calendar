class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :update, :destroy]

  # GET /schedules
  def index
    @schedules = Schedule.all
    render json: @schedules
  end

  # GET /schedules/1
  def show
    @schedule_items = ScheduleItem.where(schedule_id: @schedule.id)

    render json: {
      schedule: @schedule,
      schedule_items: @schedule_items
    }
  end

  # POST /schedules
  def create
    @schedule = Schedule.new(schedule_params)

    ### TODO postの
    for item in schedule_params[:scheduleItems] do
      @Schedule_item = @schedule.ScheduleItems.new(item)
    end

    if @schedule.save || @Schedule_item.save
      render json: @schedule, status: :created, location: @schedule
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schedules/1
  ### def update
  ###   if @schedule.update(schedule_params)
  ###     render json: @schedule
  ###   else
  ###     render json: @schedule.errors, status: :unprocessable_entity
  ###   end
  ### end
  ###
  ### # DELETE /schedules/1
  ### def destroy
  ###   @schedule.destroy
  ### end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find_by(:id_hash => params[:id])

    end

    # Only allow a trusted parameter "white list" through.
    def schedule_params
      params.require(:schedule).permit(:title, :year, :month, :description, :scheduleItems)
    end
end
