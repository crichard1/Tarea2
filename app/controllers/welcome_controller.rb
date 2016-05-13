class WelcomeController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  	
	#userId = "3231022364"
	#accessToken=  "3231022364.5b9e1e6.da34fed1557e4986a55c7cc2803a4b03"
	def index
    
  end

  def buscarTag
  	require 'json'
  	require 'rubygems'
  	require 'instagram'
  	require "hashie"
  	
  	tag = params["tag"]
    valid = Api.validateParam(tag)
    if valid == true
      returnLimit = 20
      array = Array.new
      tagArrayHash = Api.tagOjects(tag , 20)
      tagsMetadata = Api.tagMetadata(tag)
      version = '1.0.2'
      hash = { 'metadata'=> tagsMetadata, 
                'posts' => tagArrayHash,
                'version' => version
              } 
      #puts  tagArrayHash
  	
  	   render :json => hash.to_json
    else
       render :json => {:Error => 'Parametros incorrectos'}
    end


  end

end
