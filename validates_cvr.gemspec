$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "validates_cvr/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "validates_cvr"
  s.version     = ValidatesCvr::VERSION
  s.authors     = ["kaspernj"]
  s.email       = ["kaspernj@gmail.com"]
  s.homepage    = "https://www.github.com/kaspernj/validates_cvr"
  s.summary     = "ActiveRecord validations for danish CVR numbers"
  s.description = "ActiveRecord validations for danish CVR numbers"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0"

  s.add_development_dependency "best_practice_project"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "sqlite3"
end
