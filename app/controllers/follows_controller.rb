class FollowsController < ApplicationController
  before_action :authenticate_user!
  def create
    if params[:key] == "topic"
      topic = Topic.find(params[:id])
      follow_found = Follow.where(user_id: current_user.id, followable: topic).any?
      if follow_found
        flash[:notice] = 'Topic already followed'
      else
        Follow.create(user_id: current_user.id, followable: topic)
        flash[:notice] = 'Topic followed'
      end
    elsif params[:key] == "user"
      user = User.find(params[:id])
      follow_found = Follow.where(user_id: current_user.id, followable: user).any?
      if follow_found
        flash[:notice] = 'User already followed'
      else
        Follow.create(user_id: current_user.id, followable: user)
        flash[:notice] = 'User followed'
      end
    end
    redirect_to root_path
  end
end
