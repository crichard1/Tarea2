require 'test_helper'


class ApiTest < ActiveSupport::TestCase
   
   test "the truth" do
     assert true
   end

   test "createHashTagObject" do
 

   createdHash = Api.createHashTagObject(['cat' , 'nice'] , "username" , 2 , "www.una url" , "text")
   provehash = { 'tags' => ["cat" , "nice"], 
         		 'username' =>  "username" ,
         		 'likes'=>2 ,
         	 	 'url' => "www.una url" ,
         		 'caption' => "text"
         		 }
   assert provehash == createdHash		
   
   end

   test "validate params" do

   	
   	assert Api.validateParam('cat')
   	assert_not Api.validateParam('ca%t')
   	assert_not Api.validateParam('ca.t')
   	assert_not Api.validateParam('')
   	assert_not Api.validateParam(nil)

   
   end

   test "No missed objects of response " do
 	
 	returnLimit = 20
 	exampleTag='cat'
    tagArrayHash = Api.tagOjects(exampleTag , returnLimit)
    assert tagArrayHash.count==returnLimit

   end

   test "counting instagram return of elements " do
   	returnLimit = 20 
   	exampleTag='cat'
   	response = Instagram.tag_recent_media(exampleTag , {:count => returnLimit })
   	assert response.count==returnLimit
   
   end


end
