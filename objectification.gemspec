require_relative 'lib/objectification'

Gem::Specification.new do |gem|
  gem.name    = 'objectification'
  gem.version = Objectification::VERSION
  gem.license = 'MIT'
  gem.summary = 'Builds arbitrary objects from hashes'

  gem.author  = 'Chris Olstrom'
  gem.email   = 'chris@olstrom.com'

  gem.files       = `git ls-files`.split("\n")
  gem.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
end
