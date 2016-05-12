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
  
    tagArrayHash = tagOjects(tag)
    tagMetadata(tag)
  	#tagResult = JSON.parse(result)
  	#tags = tagResult["tags"]
  	render :text => "holas"

  end

  def validateParameters(tag)


  end	
  def tagMetadata(tag)
     response = Instagram.tag(tag).to_json
     hash = JSON.parse(response)
     total = hash["media_count"]
     retorno ={ 'total' => total}
     return retorno
  end
  def serviceVersion(tag)
     response = Instagram.tag(tag).to_json
     hash = JSON.parse(response)
     total = hash["media_count"]
     retorno ={ 'total' => total}
     return retorno
  end

  def tagOjects (tag)
    returnLimit = 5
    response = Instagram.tag_recent_media(tag , {:count => returnLimit })
    array = Array.new
    response.each do |result|

    hash = getInfoFromPublication(result.to_json)
    array << hash

    end
    return array
 

  end  
  def getInfoFromPublication(json)

  	hash = JSON.parse(json)

  	tags =  hash["tags"] #array 
  	username =  hash["user"]["username"]# string 
  	likes = hash["likes"]["count"]
  	text = hash["caption"]["text"]
  	type = hash["type"]


  	if type == "image"
  		url =hash["images"]["standard_resolution"]["url"]
  	end
  	if type == "video"
  		url =hash["videos"]["standard_resolution"]["url"]
  	end
  	puts "URL: " + url.to_s
    hash = createHashTagObject(tags , username, likes , url , text)
    return hash

  end

  def createHashTagObject(tags , username , likes , url , caption)

    tags = Hash[ *tags.collect { |v| [ v, v ] }.flatten ]
    hash = { 'tags' => [
          tags
          ], 
          'username' => username ,
          'likes'=>likes ,
          'url' => url ,
          'caption' => caption
          }

    return hash

  end  

end
