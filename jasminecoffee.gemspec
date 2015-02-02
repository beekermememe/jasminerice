# Provide a simple gemspec so you can easily use your
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name        = "jasminecoffee"
  s.version     = "0.1.2"
  s.authors     = ["Brendan Keogh"]
  s.summary     = "Pain free coffeescript unit testing for Rails 3.1 using jasmine 2.1"
  s.description = "Full support for the Rails 3.1 asset pipeline when bdd'ing your coffeescript or javascript using jasmine"

  s.platform    = Gem::Platform::RUBY
  s.files       = Dir["{app,config,lib,vendor}/**/*"] + ["MIT.LICENSE", "README.md"]

  s.add_dependency 'coffee-rails'
end
