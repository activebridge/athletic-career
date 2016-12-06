class BannerUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :standard do
    resize_to_fill(1920, 800)
  end
end
