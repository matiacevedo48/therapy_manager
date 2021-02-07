class RatingsController < InheritedResources::Base
    before_action :set_rating, only: [:show, :edit, :update, :destroy]
    helper_method :promedio
    # GET /ratings
    # GET /ratings.json
    def index
      @ratings = Rating.all
      @promedio = Rating.average(:rating)
      if @ratings.size == 0
        @promedio = 1
      else
        @promedio = @promedio.round(1)
      end
      @user = User.all
      #@user = current_user
     
    end
    def promedio
      @promedio = Rating.average(:rating)
    end
    # GET /ratings/1
    # GET /ratings/1.json
    def show
      
    end

    def rating_average 
      @rating = Rating.average(:rating)
    end
  
    # GET /ratings/new
    def new
      @rating = Rating.new
    end
  
    # GET /ratings/1/edit
    def edit
    end
  
    # POST /ratingss
    # POST /ratingss.json
    def create
      
      @rating = Rating.new(rating_params)
      @rating.user_id = current_user.id
    
      respond_to do |format|
        if @rating.save
          format.html { redirect_to @rating, notice: 'Rating was successfully created.' }
          format.json { render :show, status: :created, location: @rating }
        else
          format.html { render :new }
          format.json { render json: @rating.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /ratingss/1
    # PATCH/PUT /ratingss/1.json
    def update
      respond_to do |format|
        if @rating.update(rating_params)
          format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
          format.json { render :show, status: :ok, location: @rating }
        else
          format.html { render :edit }
          format.json { render json: @rating.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /ratingss/1
    # DELETE /ratingss/1.json
    def destroy
      @rating.destroy
      respond_to do |format|
        format.html { redirect_to ratings_url, notice: 'Rating was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      def set_rating
        @rating = Rating.find(params[:id])
      end
  
      def rating_params
        params.require(:rating).permit(:rating, :comments, :user_id)
      end
  
  end