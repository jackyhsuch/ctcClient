class Zone < ActiveRecord::Base
    def self.next(topicId, difficulty)
        self.where(topics_id: topicId).where("difficulty > ?", difficulty).first
    end
end
