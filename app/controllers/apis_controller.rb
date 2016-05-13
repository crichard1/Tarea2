class ApisController < ApplicationController
 skip_before_filter  :verify_authenticity_token


 def buscarTag
    require 'json'
    require 'rubygems'
    require 'instagram'
    require "hashie"
    
    tag = params["tag"]
    puts "tag: " + tag
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
    
       render :json => hash.to_json , status: :ok
    else
       render :json => {:Error => 'Parametros incorrectos'} , status: 400
    end

  end  

  
end
