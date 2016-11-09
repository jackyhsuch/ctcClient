class Zones_Question < ActiveRecord::Base

	
	belongs_to :zone
	belongs_to :question

    def self.next(zoneId, questionId)
        self.where(zone_id: zoneId).where("question_id > ?", questionId).first
    end

end
