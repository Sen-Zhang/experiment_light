class ExperimentsController < ApplicationController

  def index
    @experiments = experiment_data
  end

  def update
    if toggle_feature(params[:name], params[:env], params[:value]=='true')
      render json: {status: :ok}
    end
  end

end
