class LogsController < ApplicationController
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
end
