require "nokogiri"
require "open-uri"
require_relative "flavours"

class HtmlTitle
  extend FlavourWorker
  @queue = :flavours

  def self.get_attrs(url)
    puts "loading #{url} ..."
    page = Nokogiri::HTML(open(url))
    puts "got title #{page.css("title")}"
    {html_title: page.css("title").text}
  rescue Exception => e
    puts e
    puts e.message
    raise
  end
end
