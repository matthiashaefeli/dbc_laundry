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

private
  def box_params
    params.require(:box).permit(:business_id, :name, :address)
  end
end