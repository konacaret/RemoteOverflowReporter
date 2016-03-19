module OverflowReporter

  class CLI
    def self.start(argv)
      options  = OverflowReporter::JobListOptions.build_from_command_line_options(argv)
      listings = OverflowReporter::JobListFeed.build_from_options(options).listings
      options.add_params(listings: listings)
      OverflowReporter::JobListSummary.build_from_options(options).print_category_stats
    end

  end

end