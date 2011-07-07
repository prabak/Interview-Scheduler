class User < ActiveRecord::Base
  
  has_one :schedule
  
  before_create :generate_token

  def book_interview(schedule_id)
    schedule = Schedule.find(schedule_id)
    return false unless schedule.available
    return false unless schedule.interview_type == self.interview_type
    
    User.transaction do
      
      # if the user has an existing schedule, update that to available.
      old_schedule = Schedule.find(self.schedule_id) if self.schedule_id
      if old_schedule
        old_schedule.available = true
        old_schedule.save
      end
      self.schedule_id = schedule.id
      self.save!
      schedule.available = false
      schedule.save!
      
    end
    
  end

  private
  
  def generate_token
    self.token = Array.new(3){rand(256)}.pack('C*').unpack('H*').first
  end

end
