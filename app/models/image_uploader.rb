require "image_processing/mini_magick"
class ImageUploader < Shrine
  # plugins and uploading logic
  include ImageProcessing::MiniMagick
  plugin :processing
  plugin :versions
  plugin :delete_raw

  process(:store) do |io, context|
    original = io.download

    size_800 = resize_to_limit!(original, 800, 800)
    size_450 = resize_to_limit(size_800, 450, 450)
    size_180 = resize_to_limit(size_450, 180, 180)
    size_80  = resize_to_limit(size_180, 80 ,80)

    { original: io, large: size_800, medium: size_450, small: size_180, thumbnail: size_80 }

  end
end
