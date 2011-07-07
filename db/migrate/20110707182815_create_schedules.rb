class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.integer     :interview_type
      t.boolean     :available, :default => true
      t.datetime    :interview_date
      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
