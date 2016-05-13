class ApisController < ApplicationController
 skip_before_filter  :verify_authenticity_token
 def buscarTag
    tag = params["tag"]
    valid = Api.validateParam(tag)
    if valid == true
       hash =Api.buildResponse(tag)
       render :json => hash.to_json , status: :ok
    else
       render :json => {:Error => 'Parametros incorrectos'} , status: 400
    end
  end    
end
