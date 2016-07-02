describe 'FavouritesApi', type: :request do
  it 'returns a sucessfuly response when called' do
    get '/api/v1/favourites'
    expect(response).to have_http_status(200)
  end
end