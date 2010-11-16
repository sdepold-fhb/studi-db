class CoursesController < ApplicationController
  def index
    @courses = Course.paginate :per_page => 20, :page => params[:page], :order => "term ASC"
  end

  def new
    @course = Course.new
  end

  def edit

  end

  def show
    @course = Course.find params[:id]
  end

  def create
    @course = Course.new
    if @course.update_attributes params[:course]
      flash[:info] = "Kurs wurde erfolgreich gespeichert!"
      redirect_to :action => :show, :id => @course.id
    else
      flash[:error] = "Beim Speichern des Kurses sind Fehler aufgetreten!"
      render :edit
    end
  end

  def generate
    rand(30).times { Course.generate_random.save }
    redirect_to :action => :index
  end

  def destroy_all
    Course.destroy_all
    redirect_to :action => :index
  end
end