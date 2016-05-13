require 'rails_helper'

RSpec.describe ApisController, type: :controller do
	
	 it "responds successfully with an HTTP 200 status code" do
   	 require 'json'
    # expect(response).to have_http_status(200)
    response = post :buscarTag,   :tag => 'bird'
    expect(response).to have_http_status(200)
    #hash = JSON.parse(response)
    #expect(["metadata"].nil?)
    end


end
