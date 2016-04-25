#!/usr/bin/ruby
# Years till 100
require 'optparse'
require 'net/http'
require 'json'

class String
  def numeric?
    Float(self) != nil rescue false
  end
end


options = {:name => nil, :age => nil}

parser = OptionParser.new do|opts|
	opts.banner = "Usage: options.rb [options]"
	opts.on('-t bearer_auth') do |bearer_auth|
		options[:bearer_auth] = bearer_auth;
	end

	opts.on('-u uri') do |uri|
		options[:uri] = uri;
	end

	
	
end

parser.parse!

if options[:bearer_auth] == nil
	puts 'The following token is entered: "oQRMlkQP10XTNVRSdkTPN0XTV1TNllTP5UQfVTMwITTTNVR"' 
    options[:bearer_auth] = "oQRMlkQP10XTNVRSdkTPN0XTV1TNllTP5UQfVTMwITTTNVR"
end

if options[:uri] == nil
	print 'Enter the url: e.g.  "http://co3.local/api/1/contributors/2"'
    options[:uri] = gets.chomp
end




url = URI.parse(options[:uri])
request = Net::HTTP::Get.new(url.to_s, {"Authorization"=>'Bearer ='+options[:bearer_auth]})


http = Net::HTTP.new(url.host, url.port)
response = http.start { |http| http.request(request) }

#For a successfull request the response message is ok
puts 'response message: '+response.message

#For ok status the response code is 200
puts 'response code is: '+response.code

if response.code == "200" 
	puts 'test is successfull  '

elsif response.code == "404"
	if  request.path.split('/').last.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) != nil
		
			number = request.path.split('/').last	
			next_number = number.to_i+rand(1...10)
			options[:uri] = request.path.gsub(number,next_number.to_s )
			print 'Trying another url with different Id:  '
			puts options[:uri]
			url = URI.parse(options[:uri])	
			request = Net::HTTP::Get.new(url.to_s, {"Authorization"=>'Bearer ='+options[:bearer_auth]})


			http = Net::HTTP.new(url.host, url.port)
			response = http.start { |http| http.request(request) }

			#For a successfull request the response message is ok
			puts 'response message: '+response.message

			#For ok status the response code is 200
			puts 'response code is: '+response.code
	end
		
		
			
		
	
else
	puts 'test is not passed'
end
#Get the reponse body
#puts response.body

#Get the response header
#puts response.header




