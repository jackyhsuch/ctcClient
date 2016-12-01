class Question < ActiveRecord::Base
    def self.next(zoneId, questionId)
        self.where(zone_id: zoneId).where("id > ?", questionId).first
    end
end
