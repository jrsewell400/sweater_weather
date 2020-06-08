require 'rails_helper'

RSpec.describe ZomatoService do
  context 'instance methods' do
    context 'get_restaraunt' do
      it "returns Zomato restaraunt search data" do
        json = ZomatoService.new.get_restaraunt('38.2544472', '-104.6091409', 'italian')

        expect(json[:restaurants][0][:restaurant][:name]).to eq("Bingo Burger")
        expect(json[:restaurants][0][:restaurant][:location][:address]).to eq("101 Central Plaza 81003")
      end
    end
  end
end
