# coding: utf-8

require_relative "lib/rack/bunto/version"

Gem::Specification.new do |s|
 s.required_rubygems_version = ">= 1.3.6"

 s.name        = "rack-bunto"
 s.version     = Rack::Bunto.version

 s.summary     = "Transform your Bunto app into a Rack application."
 s.description = "Rack-Bunto transforms your Bunto app into a Rack application."

 s.authors  = ["Bryan Goines", "Suriyaa Kudo", "Adão Raul"]
 s.email    = ["adao.raul@gmail.com", "SuriyaaKudoIsc@users.noreply.github.com"]
 s.homepage = "https://github.com/bunto/rack-bunto"

 s.files = %w{
             README.markdown
             rack-bunto.gemspec
             Gemfile
             Rakefile
             History.markdown
             LICENSE
           } +
           Dir.glob("lib/**/*") +
           Dir.glob("example/**/*").reject {|f| f =~ %r(\Aexample/_site/) }
 s.test_files = Dir.glob("{test,features}/**/*")
 s.require_paths = ["lib"]

 s.extra_rdoc_files = %w[README.markdown History.markdown LICENSE]
 s.rdoc_options = ['--charset=UTF-8', '--main=README.markdown']

 s.required_ruby_version = '>= 1.9.3'

 s.add_dependency "bunto", ">= 2.0"
 ## Fix Hakiri "rack gem" warnings (https://hakiri.io/projects/5fb790ed262d7a/stacks/9b9e90f070704f/builds/e75e54c5eeb21a/warnings)
 s.add_dependency "rack", ">= 1.6.2"
 s.add_dependency "listen", ">= 1.3"

 s.add_development_dependency "rake"
 s.add_development_dependency "minitest"

 s.platform = Gem::Platform::RUBY
 s.rubyforge_project = "rack-bunto"
end
