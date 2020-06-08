require 'rails_helper'

RSpec.describe GoogleService do
  context 'instance methods' do
    context 'get_geocode' do
      it "returns Google Geocode data" do
        json = GoogleService.new.get_geocode('denver,co')

        expect(json.length).to eq(2)
        expect(json.keys).to eq([:results, :status])
        expect(json[:results][0][:address_components][0][:long_name]).to eq('Denver')
        expect(json[:results][0][:address_components][2][:short_name]).to eq('CO')
        expect(json[:results][0][:address_components][3][:long_name]).to eq('United States')
        expect(json[:results][0][:geometry][:location][:lat]).to be_a(Float)
        expect(json[:results][0][:geometry][:location][:lng]).to be_a(Float)
      end
    end
  end
end
