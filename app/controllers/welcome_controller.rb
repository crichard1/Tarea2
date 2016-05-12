class WelcomeController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  	
	#userId = "3231022364"
	#accessToken=  "3231022364.5b9e1e6.da34fed1557e4986a55c7cc2803a4b03"
	

  def buscarTag
  	require 'json'
  	require 'rubygems'
  	require 'instagram'
  	require "hashie"
  	
  	tag = params["tag"]
    valid = Api.validateParam(tag)
    if valid == true
      returnLimit = 20
      tagArrayHash = Api.tagOjects(tag , 20)
      Api.tagMetadata(tag)
      puts  tagArrayHash
  	
  	   render :text => "parametros correctos"
    else
       render :text => "parametros incorrectos"
    end


  end

end
