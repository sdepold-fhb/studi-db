class Exam < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  scope :canceled, :conditions => "canceled_at is not null"
  scope :normal, :conditions => {:canceled_at => nil}
  scope :for_course, lambda { |course| where("course_id = ?", course.id) }
  scope :attended, :conditions => "result is not null"
  scope :attending, :conditions => { :result => nil }
  scope :succeeded, :conditions => "result < 5 and result is not null"

  # cancels the exam
  def cancel!
    update_attribute :canceled_at, Time.now
  end

  # removed cancel state
  def uncancel!
    update_attribute :canceled_at, nil
  end
end
