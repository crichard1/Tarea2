require 'rails_helper'
require 'coveralls'
Coveralls.wear!('rails')
RSpec.describe Api, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"

 it "createHashTagObject" do
 

   createdHash = Api.createHashTagObject(['cat' , 'nice'] , "username" , 2 , "www.una url" , "text")
   provehash = { 'tags' => ["cat" , "nice"], 
         		 'username' =>  "username" ,
         		 'likes'=>2 ,
         	 	 'url' => "www.una url" ,
         		 'caption' => "text"
         		 }
   expect provehash == createdHash		
   
   end


    it "validate params" do

   	
   	expect Api.validateParam('cat')
    expect  !(Api.validateParam('ca%t'))
    expect  !(Api.validateParam('ca.t'))
    expect  !(Api.validateParam(''))
    expect  !(Api.validateParam(nil))

   end

   
   it "No missed objects of response " do
 	
 	returnLimit = 20
 	exampleTag='cat'
    tagArrayHash = Api.tagOjects(exampleTag , returnLimit)
    expect tagArrayHash.count==returnLimit

   end

end
