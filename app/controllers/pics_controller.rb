class PicsController < ApplicationController

  # use the method find_pic for those following methods
  before_action :find_pic, only: [:show, :edit, :update, :destroy]

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def show

  end


  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pic_params)

    if @pic.save
      redirect_to @pic, notice: "It was posted"
    else
      render 'new'
    end
  end


  def destroy

  end

  def edit

  end

  # do not have view file, update the db
  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: "Congrats, Pic was updated"
    else
      render 'edit'
    end
  end

  def destroy
    @pic.destroy
    redirect_to root_path
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :description)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end

end
