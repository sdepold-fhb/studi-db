class Course < ActiveRecord::Base
  has_many :exams, :dependent => true
  has_many :students, :through => :exams 
end
