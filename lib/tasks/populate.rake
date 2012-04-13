namespace :db do

  desc "Drop, create, migrate then populate the database with default values"

  task :populate => :environment do
  
    users = []
    
    # (1..5).each do |id|
    #   users << {:email => "#{id}@test.com", :first_name => "#{id}", :last_name => "#{id}", :interview_type => Constants::SCHEDULE_TYPE_MARKETING}
    # end
    # (6..10).each do |id|
    #   users << {:email => "#{id}@test.com", :first_name => "#{id}", :last_name => "#{id}", :interview_type => Constants::SCHEDULE_TYPE_FRONT_END}
    # end
    
    (1..10).each do |id|
      users << {:email => "#{id}@test.com", :first_name => "#{id}", :last_name => "#{id}", :interview_type => Constants::SCHEDULE_TYPE_FRONT_END}
    end
    
    users.each do |user|
      User.create(user)
    end
    
    dates = []    
    # (11..12).each do |day_slot|
    #   (10..17).each do |time_slot|
    #     dates << {:interview_date => "2011-07-#{day_slot} #{time_slot}:00:00", :interview_type => Constants::SCHEDULE_TYPE_MARKETING}
    #   end
    # end    
    # (13..14).each do |day_slot|
    #   (10..17).each do |time_slot|
    #     dates << {:interview_date => "2011-07-#{day_slot} #{time_slot}:00:00", :interview_type => Constants::SCHEDULE_TYPE_FRONT_END}
    #   end
    # end
    
    (13..14).each do |day_slot|
      (10..17).each do |time_slot|
        dates << {:interview_date => "2011-07-#{day_slot} #{time_slot}:00:00", :interview_type => Constants::SCHEDULE_TYPE_FRONT_END}
      end
    end

    dates.each do |date|
      schedule = Schedule.create(date)
    end
    
  end


end