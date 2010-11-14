class Course < ActiveRecord::Base
  has_many :exams, :dependent => :destroy
  has_many :students, :through => :exams

  def self.generate_random
    Course.new(
      :number => 1 + rand(100),
      :title => (0...(5+rand(50))).map{ ('a'..'z').to_a[rand(26)] }.join,
      :description => (0...(5+rand(500))).map{ ('a'..'z').to_a[rand(26)] }.join,
      :lecturer => (0...(5+rand(50))).map{ ('a'..'z').to_a[rand(26)] }.join,
      :term => 1 + rand(10)
    )
  end
end