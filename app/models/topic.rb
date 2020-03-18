class Topic < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :questions

  def self.set_topic(que, user, topics)
    topics = topics.split(',')
    topics.each do |topic|
      tpc = Topic.create(name: topic, user_id: user.id)
      que.topics << tpc
    end
  end
end
