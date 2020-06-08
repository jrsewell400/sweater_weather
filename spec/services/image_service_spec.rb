require 'rails_helper'

RSpec.describe 'Background Image API', type: :service do
  context 'instance methods' do
    it 'returns background image data' do
      service = ImageService.new
      json = service.get_image('denver,co')

      expect(json.length).to eq(3)
      expect(json[:results][0]).to have_key(:urls)
    end
  end
end
