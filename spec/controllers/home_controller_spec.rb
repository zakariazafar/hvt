require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  it 'responds successfully' do
    get :upload
    expect(response).to be_success
  end
  it 'returns a 200 response' do
    get :upload
    expect(response).to have_http_status '200'
  end
end
