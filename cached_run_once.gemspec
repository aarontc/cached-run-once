lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cached_run_once/version'

Gem::Specification.new do |spec|
	spec.name = 'cached_run_once'
	spec.version = CachedRunOnce::VERSION
	spec.authors = ['Aaron Ten Clay']
	spec.email = ['cachedrunonce-gem@aarontc.com']

	spec.summary = %q{Allow a block or method to be executed just once.}
	spec.description = %q{A small mixin module to allow a method or block to be executed only once throughout the lifecycle of its owner.}
	spec.homepage = 'https://github.com/aarontc/cached-run-once'
	spec.license = 'MIT'

	spec.files = `git ls-files -z`.split("\x0").reject do |f|
		f.match(%r{^(test|spec|features)/})
	end
	spec.bindir = 'exe'
	spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
	spec.require_paths = ['lib']

	spec.add_development_dependency 'bundler', '~> 1.16'
	spec.add_development_dependency 'rake', '~> 12'
	spec.add_development_dependency 'minitest', '~> 5.0'
end
