require "bundler/gem_tasks"
require 'rake/testtask'
require 'yard'

Rake::TestTask.new do |test|
  test.libs << 'test'
  test.test_files = FileList['test/application_insights.rb']
  test.verbose = true
end

YARD::Rake::YardocTask.new do |task|
  task.files   = ['lib/**/*.rb', '-', 'LICENSE.txt', 'README.md']
end

task :default => [ :test, :build, :yard ]