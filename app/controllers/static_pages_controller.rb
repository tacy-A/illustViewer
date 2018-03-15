class StaticPagesController < ApplicationController
    def home
      require 'json'
      require 'uri'
      require 'net/http'

      uri = URI.parse('your pinterest api key')
      json = Net::HTTP.get(uri)
      hash = JSON.parse(json)
      Array @parsed_data = []
        @parsed_data.concat(hash['data'])

       while hash['page']['next'] != nil
          next_uri = hash['page']['next']
          parsed_uri = URI.parse(next_uri)
          json = Net::HTTP.get(parsed_uri);
          hash = JSON.parse(json)
          @parsed_data.concat(hash['data'])
       end
    end
  end
