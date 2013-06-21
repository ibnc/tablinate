require 'rspec'
require File.dirname(__FILE__)+"/../lib/html.rb"
require File.dirname(__FILE__)+"/../lib/html/tag.rb"

describe HTML::Tag do

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
    tag = HTML::Tag.generate("tr", @params[:tbody])
    tag.should == "<tr class='meow'>"
  end

end
