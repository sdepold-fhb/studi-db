class Exam < ActiveRecord::Base
  has_one :student
  has_one :course
end
