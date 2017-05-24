class BoxesController < ApplicationController
  def index
  end
  def new
  end
  def create
    @box = Box.create(box_params)
    if @box.save
      redirect_to root_path
    else
      # missing where to redirect or where render errors
    end
  end

  def update
    @box = Box.find(params[:id])
    @box.update_attributes(box_params)
    @box.save
    if request.xhr?
      respond_to do |format|
      format.html { render partial: 'boxes/index', layout:false }
    end
    else
      redirect_to business_path
    end
  end

  def show
    @box = Box.find(params[:id])
    respond_to do |format|
      format.html { render 'boxes/show', layout:false }
    end
  end

private
  def box_params
    params.require(:box).permit(:business_id, :name, :address)
  end
end
