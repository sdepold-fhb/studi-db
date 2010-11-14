class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def index
    @students = Student.paginate(:per_page => 20, :page => params[:page])
  end

  def show
    @student = Student.find params[:id]
  end

  def edit
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
end