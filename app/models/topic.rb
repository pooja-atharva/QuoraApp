class Topic < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :questions
  has_many :follows, as: :followable

  validates_uniqueness_of :name

  def self.set_topic(que, user, topics)
    topics = topics.split(',')
    topics.each do |topic_name|
      topic = Topic.find_by(name: topic_name)
      if topic.blank?
        topic = Topic.create(name: topic_name, user_id: user.id)
      end
      que.topics << topic
    end
  end

end
