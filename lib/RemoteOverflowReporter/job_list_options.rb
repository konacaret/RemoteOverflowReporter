module RemoteOverflowReporter

  class JobListOptions
    attr_reader :options

    def initialize(params={})
      @options = params
    end

    def self.build_from_command_line_options(argv)
      parsed_options = self.new

      
      OptionParser.new do |opts|
        opts.banner = "Usage: report.rb [options]"

        opts.on("-lLOCATION", "--location=LOCATION", "Location query value") do |lo|
          parsed_options.add_params(location: lo)
        end

        opts.on("-rRANGE", "--range=RANGE", "Range (in miles) query value") do |r|
          parsed_options.add_params(range: r)
          parsed_options.add_params(distanceUnits: "Miles")
        end

        opts.on("-R", "--remote", "'Allows Remote' query flag") do
          parsed_options.add_params(allowsremote: true)
        end

        opts.on("-LLIMIT", "--limit=LIMIT", "Limit applied to results") do |li|
          limit = li.to_i
          parsed_options.add_params(limit: limit) if limit > 0
        end

        opts.on("-sSEARCHTERM", "--searchterm=SEARCHTERM", "Search term used to filter query") do |st|
          parsed_options.add_params(searchTerm: st)
        end

        opts.on("-h", "--help", "Print options help") do
          puts opts
          exit
        end

      end.parse!(argv)

      parsed_options

    end

    def add_params(params)
      options.merge!(params)
    end

  end
  
end

require 'optparse'
