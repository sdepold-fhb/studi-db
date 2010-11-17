class Course < ActiveRecord::Base
  has_many :exams, :dependent => :destroy
  has_many :students, :through => :exams

  after_create :create_exams

  VALID_MARKS = [1.3, 1.7, 2.0, 2.3, 2.7, 3.0, 3.3, 3.7, 4, 5]

  def self.generate_random
    Course.new(
      :number => 1 + rand(100),
      :title => (0...(5+rand(50))).map{ ('a'..'z').to_a[rand(26)] }.join,
      :description => (0...(5+rand(500))).map{ ('a'..'z').to_a[rand(26)] }.join,
      :lecturer => (0...(5+rand(50))).map{ ('a'..'z').to_a[rand(26)] }.join,
      :term => 1 + rand(10)
    )
  end

  def create_exams
    Student.all.map(&:create_exams)
  end
end