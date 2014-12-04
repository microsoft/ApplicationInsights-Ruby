require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |test|
  test.libs << 'test'
  test.test_files = FileList['test/application_insights.rb']
  test.verbose = true
end

task :default => [ :test, :build ]