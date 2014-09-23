class CharitiesController < ApplicationController

  def index
    @charities = Charity.all
    @charity = Charity.new
  end

  def new
    @charity = Charity.new
    respond_to do |format|
      format.html{redirect_to root_url}
      format.js
    end
  end

  def create
    @charity = Charity.create(charity_params)
    if @charity.valid?
      respond_to do |format|
        format.html{redirect_to root_url}
        format.js
      end
    else
      render 'new'
    end
  end

  def show
    @charity = Charity.find(charity_params)
  end

  def edit
    @charity = Charity.find(params[:id])
  end

  def update
    @charity = Charity.update(charity_params)
    if charity.update?
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @charity = Charity.find(params[:id])
    @charity.destroy
  end

private
  def charity_params
    params.require(:charity).permit(:name)
  end
end
