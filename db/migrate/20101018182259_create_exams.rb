class CreateExams < ActiveRecord::Migration
  def self.up
    create_table :exams do |t|
      t.integer :student_id
      t.integer :course_id
      t.float :result

      t.timestamps
    end
  end

  def self.down
    drop_table :exams
  end
end
