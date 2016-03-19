module RemoteOverflowReporter

  class CLI
    def self.start(argv)
      options  = RemoteOverflowReporter::JobListOptions.build_from_command_line_options(argv)
      listings = RemoteOverflowReporter::JobListFeed.build_from_options(options).listings
      options.add_params(listings: listings)
      RemoteOverflowReporter::JobListSummary.build_from_options(options).print_category_stats
    end

  end

end