class CatchupsController < ApplicationController
  before_action :set_friend
  before_action :set_catchup, only: [:show, :edit, :update, :destroy]

  # GET /catchups
  # GET /catchups.json
  def index
    @catchups = @friend.catchups
  end

  # GET /catchups/1
  # GET /catchups/1.json
  def show
  end

  # GET /catchups/new
  def new
    @catchup = @friend.catchups.new
  end

  # GET /catchups/1/edit
  def edit
  end

  # POST /catchups
  # POST /catchups.json
  def create
    @catchup = @friend.catchups.new(catchup_params)

    respond_to do |format|
      if @catchup.save
        format.html { redirect_to @catchup, notice: 'Catchup was successfully created.' }
        format.json { render :show, status: :created, location: @catchup }
      else
        format.html { render :new }
        format.json { render json: @catchup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catchups/1
  # PATCH/PUT /catchups/1.json
  def update
    respond_to do |format|
      if @catchup.update(catchup_params)
        format.html { redirect_to @catchup, notice: 'Catchup was successfully updated.' }
        format.json { render :show, status: :ok, location: @catchup }
      else
        format.html { render :edit }
        format.json { render json: @catchup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catchups/1
  # DELETE /catchups/1.json
  def destroy
    @catchup.destroy
    respond_to do |format|
      format.html { redirect_to catchups_url, notice: 'Catchup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catchup
      @catchup ||= @friend.catchups.find(params[:id])
    end

    def set_friend
      @friend ||= current_user.friends.find(params[:friend_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catchup_params
      params.require(:catchup).permit(:happened_at)
    end
end
