class Event < ActiveRecord::Base
    validates :name, presence: true
    validates :start_date, presence: true
    validates :start_time, presence: true
    validates :location, presence: true
    validates :creator_name, presence: true
    validates :creator_email, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
    
    
    def self.get_all_unconfirmed
        return Event.where(approved: false)
    end
    
    def self.get_all_approved
        return Event.where(approved: true)
    end

    def confirm
        self.approved = true
        self.save
    end
    
    def self.getEventsForDay(day)
        return Event.where(start_date: Date.parse(day), approved: true)
    end
    
end
