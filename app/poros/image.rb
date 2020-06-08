class Image
  attr_reader :id,
              :image_url

  def initialize(location)
    @id = nil
    @image_url = get_image_url(location)
  end

  def get_image_url(location)
    ImageService.new.get_image(location)[:results][0][:urls][:raw]
  end
end 
