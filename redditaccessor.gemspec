# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redditaccessor/version'

Gem::Specification.new do |spec|
  spec.name          = "redditaccessor"
  spec.version       = Redditaccessor::VERSION
  spec.authors       = ["Francisco Suero"]
  spec.email         = ["suerofrancisco@yahoo.com"]

  spec.summary       =  "A wrapper for the Reddit API"
  spec.description   =  "A wrapper for the Reddit API"
  spec.homepage      = "https://github.com/thecog19/reddit_accessor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
