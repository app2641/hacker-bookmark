require 'nokogiri'
require 'open-uri'

class TagController < ApplicationController

  def index
    url = generate_url Tag.all.map(&:name)
    @items = parse_rss url
  end

  def show
    url = generate_url params[:name]
    @items = parse_rss url
    if Tag.where(name: params[:name]).exists?
      @tag = Tag.find_by(name: params[:name]).official_name
    else
      @tag = params[:name]
    end
  end

  def list
    @tags = Tag.all
  end

  private

  def generate_url tags
    tags = [tags] unless tags.kind_of?(Array)
    tags = tags.join(' | ')

    date_end = Date.today.to_s
    date_begin = (Date.today - 6.days).to_s

    url = "http://b.hatena.ne.jp/search/tag?q=#{tags}&date_begin=#{date_begin}&date_end=#{date_end}&safe=off&sort=popular&mode=rss"
    URI.escape url
  end

  def parse_rss url
    ua = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36'
    rss = Nokogiri::XML open(url, "User-Agent" => ua).read
    rss.search('item')
  end
end
