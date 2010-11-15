class Exam < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  named_scope :canceled, :conditions => "canceled_at is not null"
  named_scope :normal, :conditions => {:canceled_at => nil}

  def cancel!
    update_attribute :canceled_at, Date.new
  end

  def uncancel!
    update_attribute :canceled_at, nil
  end
end
