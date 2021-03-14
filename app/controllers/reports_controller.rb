class ReportsController < ApplicationController
  before_action :set_current_user_report, only: [:edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.order(:id).page(params[:page]).includes(user: { avatar_attachment: :blob })
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report = Report.find(params[:id])
    @comments = @report.comments
  end

  # GET /reports/new
  def new
    @report = current_user.reports.build
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human) }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human) }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_user_report
      @report = current_user.reports.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:report).permit(:title, :text, :user_id)
    end
end
