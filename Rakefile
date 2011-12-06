require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "bio-ensembl"
  gem.homepage = "http://github.com/fstrozzi/bioruby-ensembl"
  gem.license = "MIT"
  gem.summary = "A Ruby API to the Ensembl database"
  gem.description = "This API provides a complete set of methods and classes to access the Ensembl database using Ruby programming language"
  gem.email = ["jan.aerts@gmail.com","francesco.strozzi@gmail.com"]
  gem.authors = ["Jan Aerts","Francesco Strozzi"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
end
Jeweler::RubygemsDotOrgTasks.new

# Tests

namespace :test do
  desc "Run tests for last supported release"
  task :last => :default do
    name = Dir.glob("test/release_*").sort[-1]
    Dir.glob(name+"/**/*test_*.rb").each do |test_case|
      ruby test_case
    end
  end
  
  desc "Run all tests"
  task :all => :default do
    Dir.glob("test//test_*.rb").each do |test_case|
      ruby test_case
    end
  end
  
  desc "Run default tests"
  task :default do
    Dir.glob("test/default/test_*.rb").each do |test_case|
      ruby test_case
    end
  end

end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "bio-ensembl #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
