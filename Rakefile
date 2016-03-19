require 'bundler/gem_tasks'

begin
  require 'rspec/core/rake_task'
  require 'cucumber/rake/task'

  RSpec::Core::RakeTask.new(:spec)

  Cucumber::Rake::Task.new(:cucumber) do |t|
    t.cucumber_opts = %w{--format progress}
  end

  task default: %w[spec cucumber]

rescue LoadError
  # no rspec available
end
