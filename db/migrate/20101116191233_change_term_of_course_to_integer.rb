class ChangeTermOfCourseToInteger < ActiveRecord::Migration
  def self.up
    change_column :courses, :term, :integer
  end

  def self.down
    change_column :courses, :term, :string
  end
end
