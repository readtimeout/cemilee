require "http/client"
require "kemal"
require "./cemilee/*"

module Cemilee
  class Client
    def initialize(url : String, payload : String? = nil)
      @url = url
      @payload = payload
    end

    {% for method in %w(get post) %}
        def {{method.id}} : String
          response = HTTP::Client.{{method.id}} @url, body: @payload
          response.body
        end
    {% end %}
  end

  post "/" do |env|
    env.response.content_type = "text/plain"
    channel = Channel(Tuple(Int32, String)).new
    requests = env.params.json["_json"].as(Array)
    request_size = requests.size

    requests.each_with_index do |item, i|
      request = item.as(Hash)
      url = request["url"].to_s.downcase
      method = request["method"].to_s.downcase
      payload = if request.has_key?("payload")
                  request["payload"].to_s
                else
                  nil
                end
      spawn do
        client = Client.new(url, payload)
        data = if method == "get"
                 client.get
               else
                 client.post
               end
        channel.send({i, data})
      end
    end
    response = Array(String).new(request_size, "")
    request_size.times do
      received = channel.receive
      response[received[0]] = received[1]
    end
    response
  end
  Kemal.run
end
