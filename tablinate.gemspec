Gem::Specification.new do |s|
  s.name        = 'tablinate'
  s.version     = '1.0.0'
  s.date        = '2013-07-06'
  s.summary     = "Generate html tables with activerecord objects!"
  s.description = "Tablinate is a ruby gem that takes arrays of hashes, ActiveRecord::Relation objects, or a JSON array of hashes, and converts them into html tables. It is intended for use in small projects or applications whose schemas are closely related to what a table's output should be."
  s.authors     = ["Kevin Collette", "Kyle Carter"]
  s.email       = ['seijounai@gmail.com', 'kevcollette@gmail.com']
  s.files       = `git ls-files`.split($/)
  s.test_files  = s.files.grep(%r{^(test|spec|features)/})
  s.homepage    = 'http://rubygems.org/gems/tablinate'
  s.add_dependency('json')
end
