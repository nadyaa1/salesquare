module DeviseCreateUsers::MerchantsHelper
  def check_merchant
    if !current_user.merchant
      flash[:error] = "Don't be stupid haha"
      redirect_to root_path
    end
  end
end
