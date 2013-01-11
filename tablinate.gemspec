Gem::Specification.new do |s|
  s.name        = 'tablinate'
  s.version     = '0.8.5'
  s.date        = '2012-11-25'
  s.summary     = "Generate html tables with activerecord objects!"
  s.description = "tablinate is a ruby gem that takes an array hashes or ActiveRecord::Relation  objects and converts them into tables in a view file. It is intended for use in small projects or applications whose schemas are closely related to what a table's output should be."
  s.authors     = ["Kevin Collette", "Kyle Carter"]
  s.email       = ['unholydh@logicmuffin.org', 'collettiquette@logicmuffin.org']
  s.files       = ["lib/tablinate.rb", "lib/html.rb", "spec/tablinate_spec.rb"]
  s.homepage    = 'http://rubygems.org/gems/tablinate'
  s.add_dependency('json')
end
