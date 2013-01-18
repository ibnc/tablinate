require 'rspec'
require File.dirname(__FILE__)+'/../lib/tablinate.rb'

describe Tablinate do
  it "should genderate an html table" do
    table_params = { 
      :table => { :class => "eek", :id => 'rawr' },
      :tbody => {
        :tr => { :class => [ 'class1', 'class2', 'class3' ], :id => 'meow' },
        :td => { :class => 'rawr', :id => [1,2,3], :foo => :bar }
      }
    }
    table = [
      { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
      { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
      { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
      { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' }
    ]
    Tablinate.generate_table(table, table_params)
  end
end
