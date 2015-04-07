# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cookieconsent/version'

Gem::Specification.new do |spec|
  spec.name          = "cookieconsent"
  spec.version       = Cookieconsent::VERSION
  spec.authors       = ["Florian Mientjes"]
  spec.email         = ["florian@mientjes.nl"]

  spec.summary       = %q{helper to wrap content in cookie consent check}
  spec.description   = %q{helper to wrap content in cookie consent check}
  spec.homepage      = "https://github.com/florianmientjes/cookieconsent"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "i18n"
end
