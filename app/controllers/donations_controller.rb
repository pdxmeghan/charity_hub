class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    @charity = Charity.find(params[:id])
    @donation = Donation.create(donation_params)
    if @donation.valid?
      flash[:notice] = "Your donation has been accepted. Thank you!"
      redirect_to charity_path(@charity)
    else
      flash[:notice] = "Your donation did not go through. Please try again."
      redirect_to charity_path(@charity)
    end
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy
    flash[:notice] = "Your donation has been deleted."
    redirect_to root_url
  end

private
  def donation_params
    params.require(:donation).permit(:user_id, :charity_id, :amount)
  end
end
