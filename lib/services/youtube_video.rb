require_relative "flavours"
require "rack"

class YoutubeVideo
  extend FlavourWorker
  @queue = :flavours

  def self.get_attrs(url)
    uri = URI.parse url
    return {} if not is_youtube(uri)
    params = decode_qs(uri.query)
    video_id = params["v"]
    #puts video_id
    return {} if not video_id
    video_info_url = "http://www.youtube.com/get_video_info?video_id="+video_id
    #puts video_info_url
    video_info_str = Net::HTTP.get_response(URI.parse(video_info_url)).body
    video_info = decode_qs(video_info_str)
    fmt_stream_map = video_info["url_encoded_fmt_stream_map"].split(",").map {|s| decode_qs(s)}
    #puts fmt_stream_map

    #puts video_info
    {
      youtube_video_title: video_info["title"],
      youtube_video_author: video_info["author"],
      # todo: we assume the first listed video has the highest quality
      # todo: need to cope with videos with obfuscated dl links
      youtube_video_dl: fmt_stream_map.first["url"],
    }
  end

  private
  def self.is_youtube(uri)
    uri.host == "youtube.com" ||
      uri.host == "www.youtube.com" ||
      uri.host == "youtu.be"
  end

  def self.decode_qs(qs) 
    Rack::Utils.parse_nested_query(qs)
  end
end
