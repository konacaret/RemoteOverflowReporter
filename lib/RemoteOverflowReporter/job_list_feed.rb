module RemoteOverflowReporter

  class JobListFeed
    attr_reader :listings, :url

    QUERY_PARAM_KEYS = [:allowsremote, :distanceUnits, :location, :range, :searchTerm]

    def initialize(params)
      @url        = params[:url]
      @listings   = params[:listings] || fetch_listings
    end

    def self.build_from_options(job_list_options)
      query_params = extract_query_params_from_options(job_list_options)
      self.new(url: build_url(query_params), query_params: query_params)
    end

  private
    def self.build_url(params)
      query   = URI.encode_www_form(params)
      URI::HTTP.build(host: "careers.stackoverflow.com", path: "/jobs/feed", query: query)
    end

    def self.extract_query_params_from_options(job_list_options)
      job_list_options.options.clone.keep_if { |k,_| QUERY_PARAM_KEYS.include? k }
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
