require 'rspec'
require File.dirname(__FILE__)+"/../lib/html.rb"

describe HTML do
  before :each do 
    @employees = [
      { :id => '1', :first_name => "Kyle", :last_name => "Carter", :title => "Software Engineer" },
      { :id => '2', :first_name => "Kevin", :last_name => "Collette", :title => "Software Engineer" },
      { :id => '3', :first_name => "David", :last_name => "Hahn", :title => "System Administrator" },
      { :id => '4', :first_name => "Brad", :last_name => "Rice", :title => "System Administrator" },
      { :id => '5', :first_name => "Roy", :last_name => "Mereness", :title => "IT Director" }
    ] 
    @body = "<tbody class='foo'><tr class='meow'><td>1</td><td>Kyle</td><td>Carter</td><td>Software Engineer</td></tr><tr class='meow'><td>2</td><td>Kevin</td><td>Collette</td><td>Software Engineer</td></tr><tr class='meow'><td>3</td><td>David</td><td>Hahn</td><td>System Administrator</td></tr><tr class='meow'><td>4</td><td>Brad</td><td>Rice</td><td>System Administrator</td></tr><tr class='meow'><td>5</td><td>Roy</td><td>Mereness</td><td>IT Director</td></tr></tbody>"
    @params = {:table => {:border => 1, :class => 'fluid'}, :tbody => {:class => 'foo', :tr => {:class => 'meow'}}}
  end
  it "should generate tag" do
    tag = HTML::Tag.generate_tag("tr", @params[:tbody])
    tag.should == "<tr class='meow'>"
  end
  it "should generate table header" do
    thead = HTML::Tag.table_head(@employees[0].keys, @params)
    thead.should == "<thead><tr><th>id</th><th>first_name</th><th>last_name</th><th>title</th></tr></thead>"
  end
  it "should generate table body" do
    tbody = HTML::Tag.table_body(@employees, @params)
    tbody.should == @body
  end
  it "should format the html output" do
    #output = HTML.format_html()
  end
end
