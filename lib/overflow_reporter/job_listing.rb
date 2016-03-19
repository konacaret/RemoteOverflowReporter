module OverflowReporter

  class JobListing
    attr_reader :categories, :description, :link, :pub_date, :source, :title

    def initialize(params)
      params.each { |k, v| self.instance_variable_set("@#{k}".to_sym, v) }
    end

    def self.build_from_parsed_feed_item(item)
      params = {
        categories:   item.categories.map(&:content),
        description:  item.description,
        link:         item.link,
        pub_date:     item.pubDate,
        source:       item,
        title:        item.title,
      }
      self.new(params)
    end

  end

end
