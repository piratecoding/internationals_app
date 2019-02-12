class FriendshipsController < ApplicationController
  def create
    @friendship = international.friendship.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = 'Added friend.'
      redirect_to root_url
    else
      flash[:notice] = 'Unable to add friend.'
      redirect_to root_url
  end

  def destroy
    @friendship = international.friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Deleted friend.'
    redirect_to :back
  end

  private
    def friendship_params
      params.require(:friendship).permit(:international_id, :friend_id)
    end
end
