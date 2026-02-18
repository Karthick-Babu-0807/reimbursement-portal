class EmployeesController < ApplicationController
  before_action :authorized_admin!
  before_action :set_employee, only: [:edit, :update, :destroy]

  def index
    @employees = Employee.includes(:department).all
  end

  def new
    @employee = Employee.new
  end

  def create
    ActiveRecord::Base.transaction do
      @user = User.create!(
        name: "#{params[:employee][:first_name]} #{params[:employee][:last_name]}",
        email: params[:employee][:email],
        password: "Welcome@123",
        role: :employee
      )

      @employee = Employee.new(employee_params)
      @employee.user = @user

      if @employee.save
        redirect_to employees_path, notice: "Employee and User account created successfully."
      else
        raise ActiveRecord::Rollback
      end
    end
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:alert] = "Error: #{e.message}"
    render :new
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      @employee.user.update(
        name: "#{@employee.first_name} #{@employee.last_name}",
        email: @employee.email
      )
      redirect_to employees_path, notice: "Employee updated successfully."
    else
      render :edit
    end
  end

  def destroy
    if @employee.destroy
      redirect_to employees_path, notice: "Employee and associated bills deleted."
    else
      redirect_to employees_path, alert: "Failed to delete employee."
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :designation, :department_id)
  end
end
