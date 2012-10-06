Gem::Specification.new do |s|
  s.name               = "kanbangit"
  s.version            = "0.0.1"
  s.default_executable = "kanbangit"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.authors = ["Guilherme Ferreira"]
  s.date = %q{2012-10-06}
  s.description = %q{A simple kanban managed under git}
  s.email = %q{guilffer@gmail.com}
  s.homepage = %q{http://rubygems.org/gems/kanbangit}
  s.rubygems_version = %q{1.8.11}
  s.summary = %q{Kanban!}

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files`.split("\n").map{|f| f[/^bin\/(.*)/, 1]}.compact
  s.require_path = 'lib'

end