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
    redirect_to business_path
  end

  def show
    @box = Box.find(params[:id])
  end

  def destroy
    @box = Box.find(params[:id])
    @box.destroy
    redirect_to business_path
  end
private
  def box_params
    params.require(:box).permit(:business_id, :name, :address)
  end
end