class SpecialtiesController < InheritedResources::Base
  before_action :set_specialty, only: [:show, :edit, :update, :destroy]

  # GET /specialtys
  # GET /specialtys.json
  def index
    @specialties = Specialty.all
  end

  # GET /specialtys/1
  # GET /specialtys/1.json
  def show
  end

  # GET /specialtys/new
  def new
    @specialty = Specialty.new
  end

  # GET /specialtys/1/edit
  def edit
  end

  # POST /specialtiess
  # POST /specialtiess.json
  def create
    @specialty = Specialty.new(specialty_params)

    respond_to do |format|
      if @specialty.save
        format.html { redirect_to @specialty, notice: 'Specialty was successfully created.' }
        format.json { render :show, status: :created, location: @specialty }
      else
        format.html { render :new }
        format.json { render json: @specialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specialtiess/1
  # PATCH/PUT /specialtiess/1.json
  def update
    respond_to do |format|
      if @specialty.update(specialty_params)
        format.html { redirect_to @specialty, notice: 'Specialty was successfully updated.' }
        format.json { render :show, status: :ok, location: @specialty }
      else
        format.html { render :edit }
        format.json { render json: @specialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialtiess/1
  # DELETE /specialtiess/1.json
  def destroy
    @specialty.destroy
    respond_to do |format|
      format.html { redirect_to specialties_url, notice: 'Specialty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_specialty
      @specialty = Specialty.find(params[:id])
    end

    def specialty_params
      params.require(:specialty).permit(:name)
    end

end
