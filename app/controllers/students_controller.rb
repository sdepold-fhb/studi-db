class StudentsController < ApplicationController
  def new
    @student = Student.new
    render :create
  end

  def index
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
    end
  end
end