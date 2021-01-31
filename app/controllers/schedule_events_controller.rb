class ScheduleEventsController < InheritedResources::Base
  before_action :set_schedule_event, only: [:show, :edit, :update, :destroy]

  # GET /schedule_events
  # GET /schedule_events.json
  def index
    @schedule_events = ScheduleEvent.fullcalendar_events(params[:user_id])
    respond_to do |format|
      format.json { render json: @schedule_events }
      format.html
    end
  end

  # GET /schedule_events/1
  # GET /schedule_events/1.json
  def show
  end

  # GET /schedule_events/new
  def new
    
    @user = User.find(params[:user_id])
    @schedule_event = ScheduleEvent.new
    
  end

  # GET /schedule_events/1/edit
  def edit
  end

  # POST /specialtiess
  # POST /specialtiess.json
  def create
    @schedule_event = ScheduleEvent.new(schedule_event_params)
    @schedule_event.user_id = current_user.id
    @user=current_user
    respond_to do |format|
      if @schedule_event.save
        
        format.html { redirect_to user_schedule_events_path(@schedule_event.user), notice: 'Schedule event was successfully created.' }
        format.json { render :show, status: :created, location: @schedule_event }
      else
        
        format.html { render :new }
        format.json { render json: @schedule_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specialtiess/1
  # PATCH/PUT /specialtiess/1.json
  def update
    respond_to do |format|
      if @schedule_event.update(schedule_event_params)
        format.html { redirect_to @schedule_event, notice: 'Schedule event was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule_event }
      else
        format.html { render :edit }
        format.json { render json: @schedule_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialtiess/1
  # DELETE /specialtiess/1.json
  def destroy
    @schedule_event.destroy
    respond_to do |format|
      format.html { redirect_to specialties_url, notice: 'Schedule event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_schedule_event
      @schedule_event = ScheduleEvent.find(params[:id])
    end

    def schedule_event_params
      params.require(:schedule_event).permit(:title, :description, :start_date, :end_date, :patient_id, :schedule_id, :user_id)
    end

end
