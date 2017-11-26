
class Line
  URI = URI.parse("https://notify-api.line.me/api/notify")
  CONFIG_DIR = "./.config/"
  CONFIG_FILE_NAME = "config.dat"
  
  def initialize(_token)


    File.open(CONFIG_DIR + CONFIG_FILE_NAME) do |file|
      file.each_line("=") do |line|
        puts line
      end
      #@TOKEN = _token
    end
  end
  def make_request(msg)
    request = Net::HTTP::Post.new(URI)
    request["Authorization"] = "Bearer #{TOKEN}"
    request.set_form_data(message: msg)
    request
  end

  def send(msg)
    request = make_request(msg)
    response = Net::HTTP.start(URI.hostname,
                               URI.port,
                               use_ssl: URI.scheme == "https") do |https|
      https.request(request)
    end
  end
end

