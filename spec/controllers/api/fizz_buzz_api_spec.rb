require 'rails_helper'

describe Api::V1::FizzBuzzController, type: :controller do
  it 'returns first 100 number by default' do
    get :index
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json[99]).to eq([100, "Buzz"])
  end

  it 'responds to max parameter' do
    get :index, {max: 20}, format: :json
    json = JSON.parse(response.body)
    expect(json[19]).to eq([20, "Buzz"])
  end

  it 'responds to page parameter' do
    get :index, {max:200, page: 2}, format: :json
    json = JSON.parse(response.body)
    expect(json[0]).to eq([101, nil])
  end

  it 'responds to page parameter' do
    get :index, {page_size: 15}, format: :json
    json = JSON.parse(response.body)
    expect(json[14]).to eq([15, 'FizzBuzz'])
  end

  it 'responds to combination of parameters' do
    get :index, {max: 300, page: 10, page_size: 20}, format: :json
    json = JSON.parse(response.body)
    expect(json[2]).to eq([183, 'Fizz'])
  end
end
