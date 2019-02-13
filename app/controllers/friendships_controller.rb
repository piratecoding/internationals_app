class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)
    if @friendship.save
      flash[:notice] = 'Added friend.'
      redirect_to root_url
    else
      flash[:error] = 'Unable to add friend.'
      redirect_to root_url
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Deleted friend.'
    redirect_to :back
  end

  private
    def friendship_params
      params.require(:friendship).permit(:international_id, :friend_id)
    end
end