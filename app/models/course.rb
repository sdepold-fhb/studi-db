class Course < ActiveRecord::Base
  has_many :exams, :dependent => :destroy
  has_many :students, :through => :exams

  after_create :create_exams

  VALID_MARKS = [1.3, 1.7, 2.0, 2.3, 2.7, 3.0, 3.3, 3.7, 4, 5]

  # randomly generates a title for a course
  def self.generate_title
    parts = [
      ["Klassifikation", "sicherheitsrelevanter Anwendungen", "in der Bildverarbeitung"],
      ["Verarbeitung", "grafischer Algorithmen", "in der modellgetriebenen Softwareentwicklung"],
      ["Management", "performanter Algorithmen", "in der Prozessmodellierung"],
      ["Konzeption", "zukünftiger Anwendungen", "in der Mediensicherheit"],
      ["Verwaltung", "theoretischer Datenstrukturen", "im Datenschutz"],
      ["Implementation", "betriebswirtschaftlicher Prozesse", "in der Mathematik"],
      ["Bewertung", "modellgetriebener Softwareentwicklung", "im industriellen Umfeld"],
      ["Konstruktion", "agiler Methoden", "in verteilten Systemen"],
      ["Analyse", "mathematischer Gleichungen", "in der Integralrechnung"],
      ["Aufbau", "wissenschaftlicher Arbeiten", "in der Computeranimation"]
    ]

    result = []
    3.times do |i|
      result << parts.sort_by{rand}.first[i]
    end

    result.join(" ")
  end

  # randomly generated the name of a lecturer
  def self.generate_lecturer
    titles = [ "Dr.", "Prof.", "Prof. Dr.", "" ]
    first_names = %w(Andre Friedrich Horst Eberhart Susanne Otto Alexander Axel Alois Sarah Martin Greta Leo Sascha Karl-Eugen Karl Paul-Eduard Paul)
    last_names = %w(Meier Hinterhuber Hunzel Brams Mustermann Schulz Fummelhauer-Beckenboden Schmidt Günther Busse Mueller Herrmann Schmidt Braun Meyer Schneider Maier Wurst Peter Engelmann Heinz Huber Schulz Fischer Becker Weber Meier Lehmann Schwab Gross Schuster Saber Schmid Krueger Wagner Werner Schulze Richter Schroeder)

    [titles.sort_by{rand}.first, first_names.sort_by{rand}.first, last_names.sort_by{rand}.first].join(" ").strip
  end

  # returns a new generated course
  def self.generate_random
    Course.new(
      :number => 1 + rand(100),
      :title => generate_title,
      :description => (0...(5+rand(500))).map{ ('a'..'z').to_a[rand(26)] }.join,
      :lecturer => generate_lecturer,
      :term => 1 + rand(10)
    )
  end

  # this methods is called after the creation of a course
  # it runs through all students and creates the exam of the course
  def create_exams
    Student.all.map(&:create_exams)
  end
end