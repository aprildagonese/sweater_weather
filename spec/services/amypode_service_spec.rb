require 'rails_helper'

describe AmypodeService do
  it "gets an antipode" do
    response = AmypodeService.new.fetch_antipode(27, -82)

    expect(response[:data]).to be_a(Hash)
    expect(response[:data][:id]).to eq("1")
    expect(response[:data][:type]).to eq("antipode")
    expect(response[:data][:attributes]).to be_a(Hash)
    expect(response[:data][:attributes][:lat]).to eq(-27)
    expect(response[:data][:attributes][:long]).to eq(98)
  end
end
