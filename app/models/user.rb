class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :questions
  has_many :answers
  has_many :topics
  has_many :follows, as: :followable

  def following
    user_ids = Follow.where(followable_type: "User", user_id: self.id).pluck(:followable_id)
    @users = User.where(id: user_ids)
  end

  def topics
    topic_ids = Follow.where(followable_type: "Topic", user_id: self.id).pluck(:followable_id)
    @topics = Topic.where(id: topic_ids)
  end
end
