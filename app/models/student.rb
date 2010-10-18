class Student < ActiveRecord::Base
  has_many :exams, :dependent => true
  has_many :courses, :through => :exams
end
