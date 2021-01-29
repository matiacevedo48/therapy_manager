class AttentionsController < InheritedResources::Base
  before_action :set_attention, only: [:show, :edit, :update, :destroy]

  # GET /attentions
  # GET /attentions.json
  def index
    #@attentions = Attention.all
    @attentions = Attention.includes(:patient).all

    if params[:rut].present?
      #Patient.where('name = ?', params[:name])
    
      
      @attentions = Attention.all
      
       
     else
       @attentions = Attention.all
     end
  end

  # GET /attentions/1
  # GET /attentions/1.json
  def show
  end

  # GET /attentions/new
  def new
    @attention = Attention.new
    @attention.patient_id = params[:patient_id]
  end

  # GET /attentions/1/edit
  def edit
  end

  # POST /attentions
  # POST /attentions.json
  def create
   
    @attention = Attention.new(attention_params)
    @attention.user_id = current_user.id
    respond_to do |format|
      if @attention.save
        format.html { redirect_to @attention, notice: 'Attention was successfully created.' }
        format.json { render :show, status: :created, location: @attention }
      else
        format.html { render :new }
        format.json { render json: @attention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attentions/1
  # PATCH/PUT /attentions/1.json
  def update
    respond_to do |format|
      if @attention.update(attention_params)
        format.html { redirect_to @attention, notice: 'Attention was successfully updated.' }
        format.json { render :show, status: :ok, location: @attention }
      else
        format.html { render :edit }
        format.json { render json: @attention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attentions/1
  # DELETE /attentions/1.json
  def destroy
    @attention.destroy
    respond_to do |format|
      format.html { redirect_to attentions_url, notice: 'Attention was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attention
      @attention = Attention.find(params[:id])
    end

    def attention_params
      params.require(:attention).permit(:patient_id, :attention_id, :user_id, :therapy, :treatment, :date, :time, :symptom)
    end

end
