class BannerUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :standard do
    resize_to_fill(1920, 800)
  end

  version :small do
    resize_to_fill(300, 200)
  end
end
