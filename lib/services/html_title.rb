require "nokogiri"
require "open-uri"
require_relative "flavours"

class HtmlTitle
  extend FlavourWorker
  @queue = :flavours

  def self.get_attrs(url)
    #puts "loading #{url} ..."
    page = Nokogiri::HTML(open(url), nil, 'utf-8')
    #puts "got title #{page.css("title")}"
    {html: {title: page.css("title").text}}
  rescue Exception => e
    puts e
    raise
  end
end
