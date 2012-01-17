$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "stalker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "stalker"
  s.version     = Stalker::VERSION
  s.authors     = ["Yomi Colledge"]
  s.email       = ["yomi@boodah.net"]
  s.homepage    = "http://github.com/baphled/stalker"
  s.summary     = "A Rails Engine to give your Rails application follower functionality"
  s.description = "Allows your users to stalk others"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.1.2"

  s.add_development_dependency "mongoid"
  s.add_development_dependency "bson_ext"
  s.add_development_dependency "rspec"
end
