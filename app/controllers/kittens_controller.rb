class KittensController < ApplicationController
  before_action :find_kitten, only: %i[ show edit update destroy]

  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render :json => @kittens}
    end
  end

  def show
    if @kitten
      respond_to do |format|
        format.html
        format.json { render :json => @kitten}
      end
    else
      flash[:danger] = "Kitten not found"
      redirect_to root_path
    end
  end

  def new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(kitten_params)

    @kitten.save

    redirect_to @kitten
  end

  def update
    @kitten.update(kitten_params)

    redirect_to @kitten
  end

  def destroy
    @kitten.delete
    redirect_to kittens_path
  end

  private

  def find_kitten
    @kitten = Kitten.find_by(id: params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
