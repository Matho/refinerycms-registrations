# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-registrations'
  s.version           = '0.1.1'
  s.description       = 'Ruby on Rails race registrations extension for Refinery CMS'
  s.date              = '2012-10-21'
  s.summary           = 'Race registrations extension for Refinery CMS'
  s.authors           = ['Martin Markech']
  s.email             = %q{martin.markech@matho.sk}
  s.homepage          = %q{http://github.com/Matho/refinerycms-registrations}
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.8'
  s.add_dependency             'humanizer'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.8'
end
