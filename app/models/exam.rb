class Exam < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  scope :canceled, :conditions => "canceled_at is not null"
  scope :normal, :conditions => {:canceled_at => nil}

  def cancel!
    update_attribute :canceled_at, Time.now
  end

  def uncancel!
    update_attribute :canceled_at, nil
  end
end
