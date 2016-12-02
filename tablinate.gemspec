# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tablinate/version'

Gem::Specification.new do |spec|
  spec.name          = 'tablinate'
  spec.date          = '2016-12-02'
  spec.version       = Tablinate::VERSION
  spec.summary       = "Generate html tables with activerecord objects!"
  spec.description   = "Tablinate is a ruby gem that takes arrays of hashes, ActiveRecord::Relation objects, or a JSON array of hashes, and converts them into html tables. It is intended for use in small projects or applications whose schemas are closely related to what a table's output should be."
  spec.authors       = [ "Isabelle Natalie Carter", "Kevin Collette" ]
  spec.email         = [ 'isabellenataliecarter@gmail.com', 'kevcollette@gmail.com' ]
  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.homepage      = 'http://rubygems.org/gems/tablinate'
  spec.add_dependency('json')
  spec.license       = "MIT"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
