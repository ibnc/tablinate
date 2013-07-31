def objects
  [
    { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
    { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
    { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
    { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' }
  ]
end

def params
   { 
    :table => { :class => "eek", :id => 'rawr' },
    :thead => { 
      :class => "head", 
      :id => 2, 
      :th => { :class => "1" },
      :tr => { :class => "class1", :id => [1,2] }
    },
    :tbody => {
      :tr => { :class => [ 'class1', 'class2', 'class3' ], :id => 'id-2' },
      :td => { :class => 'rawr', :id => [1,2,3], :foo => :bar }
    }
  }
end
