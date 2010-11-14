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
    @student = Student.find params[:id]
  end

  def update
    @student = Student.find params[:id]
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
end