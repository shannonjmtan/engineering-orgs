class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  # GET /clubs
  # GET /clubs.json
  def index
    @user = current_user
    if @user.site_admin
      @clubs = Club.all.order(:name)
    elsif @user
      @clubs = @user.clubs
    else
      redirect_to root_path
    end
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show; end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit; end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(club_params)
    @club.club_type_ids = club_type_ids
    @club.major_ids = major_ids
    @club.user_ids = current_user.id

    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    respond_to do |format|

      @club.club_type_ids = club_type_ids
      @club.major_ids = major_ids

      if @club.update(club_params)
        format.html { redirect_to dashboard_path, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:id,
                                   :name,
                                   :president,
                                   :year,
                                   :email,
                                   :website,
                                   :logo,
                                   :description,
                                   :joining)
    end

    def club_type_ids
      params[:club].require(:club_type_ids)
    end

    def major_ids
      params[:club].require(:major_ids)
    end
end
