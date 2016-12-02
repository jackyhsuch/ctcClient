class Question < ActiveRecord::Base
    def self.next(zoneId, questionId)
        self.where(zones_id: zoneId).where("id > ?", questionId).first
    end
end
