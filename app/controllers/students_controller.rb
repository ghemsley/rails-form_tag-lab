class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end
  
  def new
    @students = Student.all
    @student_info = session[:student] if session[:student]
  end

  def create 
    @student = Student.new
    @student.first_name = params[:student][:first_name]
    @student.last_name = params[:student][:last_name]
    @student.save
    session[:student] = params[:student]
    redirect_to new_student_path
  end

end
