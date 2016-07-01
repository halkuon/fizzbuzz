describe 'FizzbuzzApi', type: :request do
  it 'returns' do
    get '/api/v1/fizz_buzz'
    expect(response).to have_http_status(200)
  end
end