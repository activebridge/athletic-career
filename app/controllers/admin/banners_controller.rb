class Admin::BannersController < AdminsController
  expose :banners, -> { Banner.all.order(created_at: :desc).page(params[:page]) }
  expose :banner

  def create
    return redirect_to admin_banners_path if banner.save
    render :new
  end

  def update
    return redirect_to admin_banners_path if banner.update(banner_params)
    render :edit
  end

  def destroy
    banner.destroy
    redirect_to admin_banners_url
  end

  private

  def banner_params
    params.require(:banner).permit!
  end
end
