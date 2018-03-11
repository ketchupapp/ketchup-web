class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  # GET /friends
  def index
    @friends = current_user.friends
  end

  # GET /friends/1
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
          redirect_to @friend, notice: 'Friend was successfully created.'
        else
          render :new
        end
      end
    end
  end

  # PATCH/PUT /friends/1
  def update
    if @friend.update(friend_params)
      redirect_to @friend, notice: 'Friend was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /friends/1
  def destroy
    @friend.destroy
    redirect_to friends_url, notice: 'Friend was successfully destroyed.'
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
