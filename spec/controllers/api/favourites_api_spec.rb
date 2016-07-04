require 'rails_helper'

describe Api::V1::FavouritesController, type: :controller do
  describe 'GET #index' do
    before do
      Favourite.create(number:1)
      Favourite.create(number:2)
      get :index
    end

    it 'returns all numbers that marked as favourite' do
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json[1]['number']).to eq(2)
    end
  end

  describe 'POST #create' do
    context 'when number is passed in params' do
      it 'marks number as favourite' do
        post :create, format: :json, number: 3
        expect(response).to be_success
        expect(Favourite.last.number).to eq(3)
      end
    end

    context 'when number is omitted from params' do
      it 'returns error' do
        post :create, format: :json
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      Favourite.create(number:1)
    end

    context 'when number is passed in params' do
      it 'deletes number marked as favourite' do
        expect(Favourite.last.number).to eq(1)
        delete :destroy, format: :json, id: 1
        expect(response).to be_success
        expect(Favourite.find_by_id(1)).to be_nil
      end
    end

    context 'when number is not passed in params' do
      it 'returns error' do
        delete :destroy, format: :json, id: 'a'
        expect(response.status).to eq(422)
        expect(Favourite.last.number).to eq(1)
      end
    end
  end
end
