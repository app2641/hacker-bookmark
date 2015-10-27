class TagController < ApplicationController
  require 'rss'

  def index
    url = generate_url Tag.all.map(&:name)
    @items = parse_rss url
  end

  def show
    url = generate_url params[:name]
    @items = parse_rss url
    @tag   = params[:name]
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

    url = "http://b.hatena.ne.jp/search/tag?safe=off&sort=popular&date_end=#{date_end}&q=#{tags}&date_begin=#{date_begin}&mode=rss"
    URI.escape url
  end

  def parse_rss url
    rss = RSS::Parser.parse url
    rss.items
  end
end
