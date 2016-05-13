require 'rails_helper'

RSpec.describe ApisController, type: :controller do
	
	 it "responds successfully with an HTTP 200 status code" do
   	 
    # expect(response).to have_http_status(200)
    response = post :buscarTag, :object => { :tags => 'bird', }
    expect response!=nil
    end


end
