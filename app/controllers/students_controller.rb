class StudentsController < ApplicationController
  before_filter :find_student, :except => [:new, :index, :create]

  def new
    @student = Student.new
  end

  def index
    @students = Student.paginate(:per_page => 20, :page => params[:page])
  end

  def show
  end

  def edit
  end

  def update
    if @student.update_attributes params[:student]
      flash[:info] = "Student wurde erfolgreich gespeichert!"
      redirect_to :action => :show, :id => @student.id
    else
      flash[:error] = "Beim Speichern des Studenten sind fehler aufgetreten!"
      render :edit
    end
  end

  def create
    @student = Student.new params[:student]
    if @student.save
      flash[:info] = "Student wurde erfolgreich angelegt!"
      redirect_to :action => :show, :id => @student.id
    else
      flash[:error] = "Beim Anlegen des Studenten sind fehler aufgetreten!"
      render :new
    end
  end

  def destroy
    @student.destroy
    redirect_to :action => :index
  end

  def marks
  end

  def generate_marks
    @student.generate_marks
    redirect_to :action => :marks, :id => params[:id]
  end

  def courses
  end

  def generate_courses
    @student.generate_courses
    redirect_to :action => :courses, :id => params[:id]
  end

  def cancel_courses
    exams = @student.exams.normal.find(params[:exam_ids])
    exams.map(&:cancel!)
    redirect_to :action => :courses, :id => params[:id]
  end

  def uncancel_courses
    exams = @student.exams.canceled.find(params[:exam_ids])
    exams.map(&:uncancel!)
    redirect_to :action => :courses, :id => params[:id]
  end

  private

  def find_student
    @student = Student.find params[:id]
  end
end