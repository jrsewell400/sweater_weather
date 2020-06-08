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

    context "get_distance" do
      it "returns Google Maps distance data" do 
        json = GoogleService.new.get_distance('pueblo,co', 'denver,co')

        expect(json[:routes][0][:legs][0][:duration]).to have_key(:text)
        expect(json[:routes][0][:legs][0][:duration][:text]).to eq("1 hour 49 mins")
      end
    end
  end
end
