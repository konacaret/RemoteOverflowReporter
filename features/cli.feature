Feature: The RemoteOverFlowReporter CLI
  In order to get reports on Stack Overflow Career listings
  As a CLI user
  I want to generate a listings category report

  Scenario: View 'help' menu
    When I run `remote_overflow_reporter -h`
    Then the output should contain:
    """
Usage: report.rb [options]
    """

  @vcr
  Scenario: Generate an unfiltered report
    When I run `remote_overflow_reporter`
    Then the output should contain:
    """
total number of listings: 1000
    """

  @vcr
  Scenario: Generate a report with a search term added
    When I run `remote_overflow_reporter --searchTerm="ZeroMQ"`
    Then the output should contain:
    """
total number of listings: 8
    """

  @vcr
  Scenario: Generate a report with a limit value
    When I run `remote_overflow_reporter -L25`
    Then the output should contain:
    """
total number of listings: 1000
displaying top 25 categories
    """

  @vcr
  Scenario: Generate a report with a location value
    When I run `remote_overflow_reporter -l"San Francisco, CA"`
    Then the output should contain:
    """
total number of listings: 211
    """

  @vcr
  Scenario: Generate a report with a location value with a range
    When I run `remote_overflow_reporter -l"San Francisco, CA" -r5`
    Then the output should contain:
    """
total number of listings: 199
    """

  @vcr
  Scenario: Generate a report with the 'remote' flag set
    When I run `remote_overflow_reporter -R`
    Then the output should contain:
    """
total number of listings: 361
    """
