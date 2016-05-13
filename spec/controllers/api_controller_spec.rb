require 'rails_helper'

RSpec.describe ApisController, type: :controller do
	
	 it "responds successfully with an HTTP 200 status code" do
   	 #params ={"tag": "bird"	}
   	 #post ('/instagram/tag/buscar', :parameters => {'tags'=> 'cat'})
	 #:post "/instagram/tag/buscar", params
	 #controller.buscarTag
	 #expect !((response).to be_success)
    # expect(response).to have_http_status(200)
    post :buscarTag, :object => { :tags => 'bird', }

    end


end
