class Array
  def tablinate(params={})
    Tablinate.generate_table(self, params)
  end
end
