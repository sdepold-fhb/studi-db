class AddFieldsToExam < ActiveRecord::Migration
  def self.up
    add_column :exams, :number, :integer
    add_column :exams, :location, :string
    add_column :exams, :date, :date
    add_column :exams, :examiner, :string
    add_column :exams, :credit_points, :integer
    add_column :exams, :requirements, :text
    add_column :exams, :attempt, :integer
    add_column :exams, :registered_at, :date
    add_column :exams, :canceled_at, :date
    remove_column :exams, :name
  end

  def self.down
    remove_column :exams, :canceled_at
    remove_column :exams, :registered_at
    remove_column :exams, :attempt
    remove_column :exams, :requirements
    remove_column :exams, :credit_points
    remove_column :exams, :examiner
    remove_column :exams, :date
    remove_column :exams, :location
    remove_column :exams, :number
  end
end
