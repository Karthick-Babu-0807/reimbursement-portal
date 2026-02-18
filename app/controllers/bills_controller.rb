class BillsController < ApplicationController
  before_action :authorized_admin!, only: [:approve, :reject]
  before_action :prevent_admin_submission, only: [:new, :create]

  def index
    if current_user.admin?
      @bills = Bill.includes(employee: :department).all
      @total_submitted = @bills.sum(:amount)
      @total_approved = @bills.approved.sum(:amount)
      @total_rejected  = @bills.rejected.sum(:amount)
    else
      @bills = current_user.employee.bills
      @total_submitted = @bills.sum(:amount)
      @total_approved = @bills.approved.sum(:amount)
      @total_rejected  = @bills.rejected.sum(:amount)
    end
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = current_user.employee.bills.build(bill_params)
    @bill.status = :pending

    if @bill.save
      redirect_to bills_path, notice: "Bill submitted for review."
    else
      render :new
    end
  end

  def approve
    @bill = Bill.find(params[:id])
    @bill.approved!
    redirect_to bills_path, notice: "Bill approved successfully."
  end

  def reject
    @bill = Bill.find(params[:id])
    @bill.rejected!
    redirect_to bills_path, alert: "Bill rejected."
  end

  private

  def bill_params
    params.require(:bill).permit(:amount, :bill_type)
  end

  def prevent_admin_submission
    if current_user.admin?
      redirect_to bills_path, alert: "Admins cannot submit reimbursement bills."
    end
  end
end