class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    @charity = Charity.find(params[:charity_id])
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
    params.require(:donation).permit(:charity_id, :amount, :token).merge(:user_id => current_user.id)
  end
end
