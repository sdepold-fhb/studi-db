class Student < ActiveRecord::Base
  has_many :exams, :dependent => :destroy
  has_many :courses, :through => :exams

  validates_presence_of :matriculation_number
  validates_uniqueness_of :matriculation_number
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :birthday
  validates_presence_of :place_of_birth
  validates_presence_of :study_course
  validates_presence_of :nationality
  validates_presence_of :current_term
  validates_presence_of :street
  validates_presence_of :house_number
  validates_presence_of :zip_code
  validates_presence_of :city
end
