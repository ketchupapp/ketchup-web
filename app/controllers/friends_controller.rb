class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  # GET /friends
  # GET /friends.json
  def index
    @friends = current_user.friends.includes(:last_catchup).order("catchups.happened_at ASC NULLS FIRST")
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    @friend = current_user.friends.new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json
  def create
    respond_to do |format|
      format.json do
        @friends = bulk_friend_params.map do |friend_params|
          Friend.new(friend_params.merge(user: current_user))
        end.each(&:save)

        friends, errors = @friends.partition{|f| f.errors.empty? }
        errors.map!{|e| e.as_json.merge(errors: e.errors) }
        render json: {friends: friends, errors: errors}
      end

      format.html do
        @friend = Friend.new(friend_params.merge(user: current_user))

        if @friend.save
          redirect_to friends_path, notice: 'Friend was successfully created.'
        else
          render :new
        end
      end
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to friends_path, notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_path, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = current_user.friends.find(params[:id])
    end

    def bulk_friend_params
      params.require(:friends).map do |object|
        object.permit(:name, :nickname, :avatar_url)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def friend_params
      params.require(:friend).permit(:name, :nickname, :avatar_url)
    end
end
