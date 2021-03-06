class ReportsController < ApplicationController
  before_action :set_report, only: [:edit, :show, :update]
  before_action :move_to_index, only: [:edit, :show]

  def index
    @report = current_user.reports
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.valid?
      @report.save
      redirect_to root_path, notice: "日報「#{@report.title}」を作成しました。"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @report.update(report_params)
      redirect_to root_path, notice: "日報「#{@report.title}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to root_path, notice: "日報「#{report.title}」を削除しました。"
  end

  private

  def report_params
    params.require(:report).permit(:title, :text).merge(user_id: current_user.id)
  end

  def set_report
    @report = Report.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if current_user.id != @report.user.id
  end
end