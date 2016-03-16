module RemoteOverflowReporter

  class JobListFeed
    attr_reader :listings, :url

    def initialize(params)
      @url        = params[:url]
      @listings   = params[:listings] || fetch_listings
    end

    def self.build_from_query_params(query_params)
      self.new(url: build_url(query_params))
    end

  private
    def self.build_url(params)
      query   = URI.encode_www_form(params)
      URI::HTTP.build(host: "careers.stackoverflow.com", path: "/jobs/feed", query: query)
    end

    def fetch_listings
      parsed_feed.items.map { |i| JobListing.build_from_parsed_feed_item(i) }
    end

    def raw_feed
      @raw_feed ||= open(url)
    end

    def parsed_feed
      @parsed_feed ||= RSS::Parser.parse(raw_feed)
    end

  end

end

require 'rss'
require 'open-uri'
