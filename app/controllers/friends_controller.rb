class FriendsController < ApplicationController
  def list
    @users = User.all
  end

  def add
    friend = User.find_by_id(params[:friend_id])
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Successfuly sent  friend request to #{friend.first_name} #{friend.last_name}"
    else
      flash[:notice] = "Unable to add friend."
    end
    redirect_to friends_list_path
  end

  def accept
    @friendship = Friendship.where(user_id: params[:friend_id], friend_id: current_user.id).first
    @friendship.status = 2
    friend = User.find_by_id(@friendship.user.id)
    if @friendship.save
      flash[:notice] = "Congratulation! You and #{friend.first_name} #{friend.last_name} are now friend"
    else
      flash[:notice] = "Could not accept the friend request now"
    end
    redirect_to friends_list_path
  end

  def my_friends
    @users = current_user.friends + current_user.inverse_friends
  end
end
