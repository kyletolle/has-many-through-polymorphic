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
