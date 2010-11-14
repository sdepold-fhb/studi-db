class RenameLacturerFromCourseToLecturer < ActiveRecord::Migration
  def self.up
    rename_column :courses, :lacturer, :lecturer
  end

  def self.down
    rename_column :courses, :lecturer, :lacturer
  end
end
