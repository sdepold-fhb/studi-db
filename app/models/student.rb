class Student < ActiveRecord::Base
  has_many :exams, :dependent => :destroy
  has_many :courses, :through => :exams

  validates_presence_of :matriculation_number
  validates_uniqueness_of :matriculation_number
  validates_presence_of :first_name
  validates_presence_of :last_name
#  validates_presence_of :birthday
  validates_presence_of :place_of_birth
  validates_presence_of :study_course
  validates_presence_of :nationality
  validates_presence_of :current_term
  validates_presence_of :street
  validates_presence_of :house_number
  validates_presence_of :zip_code
  validates_presence_of :city

  after_create :create_exams

  def generate_marks
    exams.attending.each do |e|
      e.update_attribute :result, Course::VALID_MARKS.sample
    end
  end

  def is_attending? course
    exams.for_course(course).attending.present?
  end

  def attended_exam_in? course
    exams.for_course(course).attended.present?
  end

  def succeeded_in? course
    attended_exam_in?(course) and exams.for_course(course).succeeded.present?
  end

  def attempts_for course
    exams.for_course(course).first(:order => "attempt DESC").attempt rescue 0
  end

  def create_exams
    Course.all.each do |course|
      next if is_attending?(course) or succeeded_in?(course)

      exam_options = {
          :student_id => self.id,
          :course_id => course.id,
          :number => course.number,
          :attempt => attempts_for(course) + 1,
          :registered_at => Time.now
      }

      exams << Exam.create(exam_options)
    end
  end
end