class TagController < ApplicationController
  require 'rss'

  def index
    @items = []
  end

  def show
    date_end = Date.today.to_s
    date_begin = (Date.today - 6.days).to_s
    url = "http://b.hatena.ne.jp/search/tag?safe=off&sort=popular&date_end=#{date_end}&q=#{params[:name]}&date_begin=#{date_begin}&mode=rss"
    rss = RSS::Parser.parse(url)
    @items = rss.items
    @tag   = params[:name]
  end

  def list
    @tags = Tag.all
  end
end
