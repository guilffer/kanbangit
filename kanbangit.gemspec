$:.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name          = "kanbangit"
  s.version       = "0.0.1"
  s.platform      = Gem::Platform::RUBY
  s.author        = "Guilherme Ferreira"
  s.email         = "guilffer@gmail.com"
  s.homepage      = "http://guilffer.com/kanbangit"
  s.summary       = "manage your wip using the power of git"
  s.description   = "Kanbangit is a tool for managing the work-in-progress in a distributed environment using git."

  s.required_rubygems_version = ">= 1.3.6"

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", "~> 2.11.0"
  s.add_development_dependency "rspec-core", "~> 2.11.1"
  s.add_development_dependency "rspec-expectations", "~> 2.11.3"
  s.add_development_dependency "rspec-mocks", "~> 2.11.3"
  s.add_development_dependency "fakefs", "~> 0.4.0"

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files`.split("\n").map{|f| f[/^bin\/(.*)/, 1]}.compact
  s.require_path  = 'lib'
end