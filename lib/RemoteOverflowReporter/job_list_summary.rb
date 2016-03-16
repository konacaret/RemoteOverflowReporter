module RemoteOverflowReporter

  class JobListSummary
    attr_reader :feed, :limit

    def initialize(params)
      @feed   = params[:feed]
      @limit  = params[:limit]
    end

    def print_category_stats
      print_header
      categories_with_counts.each { |name, count| print_category_with_count(name, count) }
      print_footer
    end

  private
    def category_map
      @category_map ||= begin
        default_map = Hash.new { |h, k| h[k] = 0 }

        feed.listings.reduce(default_map) do |hash, listing|
          listing.categories.each { |tag| hash[tag] += 1 }
          hash
        end
      end
    end

    def categories_with_counts
      @categories_with_counts ||= begin
        results = category_map.map { |k, v| [k,v] }.\
                           sort_by { |a| [a.last * -1, a.first] }
        limit ? results.take(limit) : results
      end
    end

    def listing_count
      @listing_count ||= feed.listings.size * 1.0
    end

    def calc_listing_appearance_percentage(count)
      ((count / listing_count) * 100).round
    end

    def print_header
      puts " category".ljust(30) + "| count | appearance %"
      puts "-" * 30 + "+" + "-" * 7 + "+" + "-" * 14
    end

    def print_category_with_count(name, count)
      puts " #{name.ljust(29)}| #{count.to_s.ljust(6)}| #{calc_listing_appearance_percentage(count)}%"
    end

    def print_footer
      puts "\ntotal number of listings: #{listing_count.to_i}"
      puts "displaying top #{limit} listings" if limit
    end

  end

end
