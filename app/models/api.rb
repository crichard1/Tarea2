  class Api < ActiveRecord::Base



  def self.buildResponse(tag)
    require 'json'
    require 'rubygems'
    require 'instagram'
    require "hashie"
   
   
      returnLimit = 20
      array = Array.new
      tagArrayHash = Api.tagOjects(tag , 20)
      tagsMetadata = Api.tagMetadata(tag)
      version = '1.0.2'
      hash = { 'metadata'=> tagsMetadata, 
                'posts' => tagArrayHash,
                'version' => version
              } 
      return hash
  
  end 
  def self.tagMetadata(tag)
     response = Instagram.tag(tag).to_json
     hash = JSON.parse(response)
     total = hash["media_count"]
     retorno ={ 'total' => total}
     return retorno
  end

  def self.validateParam(tag)

  	stringProve = tag.is_a? String  

  	if stringProve ==false
  		return false
  	end
  	
  	if tag.nil?
  		return false
  	end
  	if tag.empty?
  		return false
  	end
  	whiteSpace = tag.match(" ")
  	if whiteSpace ==true
  		return false
  	end
  	special = "?<>,?[]}{=-)(*&^%$#`~{}."
	regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
  	if tag =~ regex	
  		return false
  	end	
		
  	return true

  end

  def self.tagOjects (tag , returnLimit)
   
    response = Instagram.tag_recent_media(tag , {:count => returnLimit })
    array = Array.new
    response.each do |result|
    hash = getInfoFromPublication(result.to_json)
    array << hash

    end
    return array
  end  

  def self.getInfoFromPublication(json)

  	hash = JSON.parse(json)

  	tags =  hash["tags"] #array 

  	username =  hash["user"]["username"]# string 
  	likes = hash["likes"]["count"]
    
    if hash["caption"].nil?
      text="no text"
    else
      text = hash["caption"]["text"]
    end

  	type = hash["type"]

  	if type == "image"
  		url =hash["images"]["standard_resolution"]["url"]
  	end
  	if type == "video"
  		url =hash["videos"]["standard_resolution"]["url"]
  	end
  
    hash = createHashTagObject(tags , username, likes , url , text)
    return hash

  end

  def self.createHashTagObject(tags , username , likes , url , caption)

   
    hash = { 'tags' => tags, 
          'username' => username ,
          'likes'=>likes ,
          'url' => url ,
          'caption' => caption
          }

    return hash

  end  

end
