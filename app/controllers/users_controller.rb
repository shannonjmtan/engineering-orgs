class UsersController < ApplicationController
  before_action :set_current_user, only: [:dashboard, :show, :index, :new, :create]
  before_action :check_super_user, only: [:index, :new, :create, :destroy]
  before_action :set_user, only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  def dashboard
    if @user.site_admin
      @clubs = Club.all.order(:name)
    elsif @user
      @clubs = @user.clubs
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.club_ids = user_params[:club_ids]
    respond_to do |format|
      if @user.save
        format.html { render action: 'show', notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      @user.club_ids = user_params[:club_ids]
      if @user.update(user_params)
        format.html { redirect_to dashboard_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :username, :email, :password, :password_confirmation, :site_admin, :club_ids => [])
    end
end
