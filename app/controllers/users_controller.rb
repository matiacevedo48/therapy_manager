class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    #@pie_kinds = Bookmark.joins(:kind).group("kinds.name").count
    @pie_users = Attention.joins(:user).group("users.therapy").count
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /specialtiess
  # POST /specialtiess.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specialtiess/1
  # PATCH/PUT /specialtiess/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.js
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialtiess/1
  # DELETE /specialtiess/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to specialties_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:password, :email, :username, :password_confirmation, specialty_ids: [])
  end

end
