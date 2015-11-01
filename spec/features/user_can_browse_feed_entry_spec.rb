require 'spec_helper'
require "webmock/rspec"

feature 'user can browse feed entry' do
  let!(:ruby) { create :tag, :ruby }
  let!(:php) { create :tag, :php }

  background do
    allow(Date).to receive(:today) { Date.new(2015, 10, 10) }
    stub_request(:get, url).to_return(body: FEEDS, status: 200)
  end

  context 'when access tag#index' do
    let(:url) { 'http://b.hatena.ne.jp/search/tag?q=ruby%20%7C%20php&date_begin=2015-10-04&date_end=2015-10-10&safe=off&sort=popular&mode=rss' }

    scenario 'show late-breaking entry' do
      visit root_path
      expect(page).to have_content '最新のエントリ'
    end
  end

  context 'when access tag#show' do
    let(:url) { 'http://b.hatena.ne.jp/search/tag?q=ruby&date_begin=2015-10-04&date_end=2015-10-10&safe=off&sort=popular&mode=rss' }

    scenario 'show ruby entry' do
      visit entries_path(name: ruby.name)
      expect(page).to have_content ruby.official_name
    end
  end

  FEEDS = <<-RSS
    <?xml version="1.0" encoding="UTF-8"?>
    <rdf:RDF
     xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
     xmlns="http://purl.org/rss/1.0/"
     xmlns:content="http://purl.org/rss/1.0/modules/content/"
     xmlns:taxo="http://purl.org/rss/1.0/modules/taxonomy/"
     xmlns:opensearch="http://a9.com/-/spec/opensearchrss/1.0/"
     xmlns:dc="http://purl.org/dc/elements/1.1/"
     xmlns:hatena="http://www.hatena.ne.jp/info/xmlns#"
     xmlns:media="http://search.yahoo.com/mrss"
    >
      <channel rdf:about="http://b.hatena.ne.jp/search/tag?safe=off&sort=recent&q=ruby&users=3">
        <title>タグ「ruby」を検索 - はてなブックマーク</title>
        <link>http://b.hatena.ne.jp/search/tag?safe=off&sort=recent&q=ruby&users=3</link>
        <description>タグ「ruby」を検索 - はてなブックマーク</description>
        <items>
          <rdf:Seq>
            <rdf:li rdf:resource="https://google.com"/>
          </rdf:Seq>
        </items>
      </channel>
      <item rdf:about="https://google.com">
        <title>Google</title>
        <link>https://google.com</link>
        <dc:date>2015-11-01T12:52:02+09:00</dc:date>
      </item>
    </rdf:RDF>
  RSS
end
