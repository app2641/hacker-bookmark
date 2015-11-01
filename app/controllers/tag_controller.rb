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
    @tag   = Tag.find_by(name: params[:name])
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
    rss = Nokogiri::XML open(url)
    rss.search('item')
  end
end
