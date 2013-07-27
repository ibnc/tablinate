module Tablinate
  module ActiveRecord
    module Tablination
      def tablinate(params={})
        rel = to_a()
        Tablinate.generate_table(rel, params)
      end
    end

    ::ActiveRecord::Relation.extend Tablination
  end
end
