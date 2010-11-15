class ChangeCanceledAtOfExamToDateTime < ActiveRecord::Migration
  def self.up
    change_column :exams, :canceled_at, :datetime
    change_column :exams, :registered_at, :datetime
  end

  def self.down
    change_column :exams, :canceled_at, :date
    change_column :exams, :registered_at, :date
  end
end
