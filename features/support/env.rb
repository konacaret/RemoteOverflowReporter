require 'aruba/cucumber'
require 'vcr'
require 'webmock'
require 'overflow_reporter'
require 'pry'

VCR.cucumber_tags do |t|
  t.tag  '@vcr', :use_scenario_name => true
end

VCR.configure do |c|
  c.cassette_library_dir     = 'features/cassettes'
  c.default_cassette_options = { :record => :new_episodes }
  c.hook_into :webmock
end

class VcrFriendlyMain
  def initialize(argv, stdin, stdout, stderr, kernel)
    @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
  end

  def execute!
    $stdin   = @stdin
    $stdout  = @stdout
    OverflowReporter::CLI.start(@argv)
  end
end

Before('@vcr') do
  aruba.config.command_launcher = :in_process
  aruba.config.main_class = VcrFriendlyMain
end

After('@vcr') do
  aruba.config.command_launcher = :spawn

  VCR.eject_cassette
  $stdin = STDIN
  $stdout = STDOUT
end
