require 'active_record'

module Tablinate
  class ActiveRecord::Relation
      def tablinate(params={})
        rel = to_a()
        Tablinate.generate_table(rel, params)
      end
  end
    #::ActiveRecord::Base.extend Tablination
    #::ActiveRecord::Relation.extend Tablination
end

