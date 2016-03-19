module RemoteOverflowReporter

  class JobListSummary
    attr_reader :listings, :limit

    SUMMARY_PARAM_KEYS = [:limit, :listings]

    def initialize(params)
      @listings = params[:listings]
      @limit    = params[:limit]
    end

    def self.build_from_options(job_list_options)
      summary_params = extract_summary_params_from_options(job_list_options)
      self.new(summary_params)
    end

    def print_category_stats
      print_header
      categories_with_counts.each { |name, count| print_category_with_count(name, count) }
      print_footer
    end

  private
    def self.extract_summary_params_from_options(job_list_options)
      job_list_options.options.clone.keep_if { |k,_| SUMMARY_PARAM_KEYS.include? k }
    end

    def category_map
      @category_map ||= begin
        default_map = Hash.new { |h, k| h[k] = 0 }

        listings.reduce(default_map) do |hash, listing|
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
      @listing_count ||= listings.size * 1.0
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
      puts "displaying top #{limit} categories" if limit
    end

  end

end
