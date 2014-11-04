class LogsController < ApplicationController
  before_action :load_log, only: [ :show, :edit, :update, :destroy ]

  def index
    @logs = Log.all
  end

  def new
    @log = Log.new
  end

  def create
    @log = Log.new log_attrs

    if @log.save
      redirect_to logs_path

    else
      flash[:error] = "Couldn't create the log."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @log.update log_attrs
      redirect_to log_path(@log)

    else
      flash[:error] = "Couldn't update the log."
      render :edit
    end
  end

  def destroy
    unless @log.destroy
      flash[:error] = "Couldn't destroy the log."
    end

    redirect_to logs_path
  end

private
  def log_attrs
    params.require(:log).
      permit(:entry_name,
            )
  end

  def load_log
    @log = Log.find params[:id]
  end
end
