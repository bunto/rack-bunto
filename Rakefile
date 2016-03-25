require 'rake/testtask'


task :default => :test

Rake::TestTask.new do |t|
  t.pattern = 'test/test_*.rb'
  t.verbose = true
  t.warning = true
end

desc "Build gem"
task :build do
  sh "gem build rack-bunto.gemspec"
end

desc "Install gem"
task :install => :build do
  sh "gem install rack-bunto-#{Rack::Bunto.version}.gem"
end

desc "Push gem to rubygems.org"
task :push do
  sh "gem push rack-bunto-#{Rack::Bunto.version}.gem"
end

desc "Clean up gem"
task :clean do
  sh "rm *.gem"
end

desc "Run demo"
task :demo do
  puts " ==> Starting demo: http://localhost:3000/"
  Dir.chdir("example") do
    sh "rackup -p 3000"
  end
end
