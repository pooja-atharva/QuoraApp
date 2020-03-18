class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.all
  end

  def following
    user_ids = Follow.where(followable_type: "User", user_id: current_user.id).pluck(:followable_id)
    @users = User.where(id: user_ids)
  end
  
  def follow_topic
    topic_ids = Follow.where(followable_type: "Topic", user_id: current_user.id).pluck(:followable_id)
    @topics = Topic.where(id: topic_ids)
  end

end
