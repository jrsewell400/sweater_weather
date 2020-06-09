class ImageService
  def connection
    Faraday.new(url: 'https://api.unsplash.com')
  end

  def get_image(location)
    response = connection.get('/search/photos') do |add|
      add.params['client_id'] = ENV['UNSPLASH-ACCESS-KEY']
      add.params[:query] = "#{location}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
