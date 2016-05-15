require 'rails_helper'

RSpec.describe ApisController, type: :controller do
	
	it "responds successfully with an HTTP 200 status code" do
   	require 'json'
    post :buscarTag,   :tag => 'bird'
    expect(response).to have_http_status(200)
    expect(response.content_type).to eq "application/json"
    end



end
