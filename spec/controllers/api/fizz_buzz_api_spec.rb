require 'rails_helper'

describe Api::V1::FizzBuzzController, type: :controller do
  it 'returns' do
    get :index
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json['5']).to eq('Buzz')
  end
end