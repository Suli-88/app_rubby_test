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
	opts.on('-b filepath') do |filepath|
		options[:filebath] = filepath;
	end

	
	
end

parser.parse!

if options[:bearer_auth] == nil
    puts 'The following token is entered: "oQRMlkQP10XTNVRSdkTPN0XTV1TNllTP5UQfVTMwITTTNVR"' 
    options[:bearer_auth] = "oQRMlkQP10XTNVRSdkTPN0XTV1TNllTP5UQfVTMwITTTNVR"
end

if options[:uri] == nil
	print 'Enter the url: e.g.  "http://co3.local/api/1/congresses"'
    options[:uri] = gets.chomp
end

if options[:filebath] == nil
	print 'Enter the path of the json file that contains the body"'
    options[:filebath] = gets.chomp
end




url = URI.parse(options[:uri])

request = Net::HTTP::Post.new(url.to_s, {"Authorization"=>'Bearer ='+options[:bearer_auth], 'Content-Type' => 'application/json'})





file = File.open(options[:filebath],"rb")
       contents = ""
file.each {|line|
  contents << line
}

request.body = contents

http = Net::HTTP.new(url.host, url.port)
response = http.start { |http| http.request(request) }



#For a successfull request the response message is ok
puts 'response message: '+response.message

#For ok status the response code is 200
puts 'response code is: '+response.code





if response.code == "201" 
	puts 'test is successfull  '
end

#Get the reponse body
#Show the body of the response
puts 'the body of the Post response: '
puts response.body

#Get the response header
#puts response.header




