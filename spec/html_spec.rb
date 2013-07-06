require 'rspec'
require 'nokogiri'
require File.dirname(__FILE__)+'/../lib/tablinate.rb'

describe HTML do
  before :each do 
    @employees = [
      { :id => '1', :first_name => "Kyle", :last_name => "Carter", :title => "Software Engineer" },
      { :id => '2', :first_name => "Kevin", :last_name => "Collette", :title => "Software Engineer" },
      { :id => '3', :first_name => "David", :last_name => "Hahn", :title => "System Administrator" },
      { :id => '4', :first_name => "Brad", :last_name => "Rice", :title => "System Administrator" },
      { :id => '5', :first_name => "Roy", :last_name => "Mereness", :title => "IT Director" }
    ] 
    @params = {:table => {:border => 1, :class => 'fluid'}, :tbody => {:class => 'foo', :tr => {:class => 'meow'}}}
  end

  it "should generate table header" do
    thead = HTML.table_head(@employees[0].keys, @params)
    doc = Nokogiri::XML(thead.to_s)
    doc.errors.should == []
  end
  it "should generate table body" do
    tbody = HTML.table_body(@employees, @params)
    doc = Nokogiri::XML(tbody.to_s)
    doc.errors.should == []
  end
  it "should format the html output" do
    #output = HTML.format_html()
  end
end
