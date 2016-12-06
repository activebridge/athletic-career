class Admin::BannersController < ApplicationController
  expose :banners, -> { Banner.all }
  expose :banner

  def create
    if banner.save
      redirect_to admin_banners_path, notice: t('.banner_created')
    else
      render :new
    end
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
