require 'rspec'
require 'nokogiri'
require File.dirname(__FILE__)+"/../lib/tablinate.rb"

describe HTML::Tag do

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

  it "should genderate tag and appropriate end tag" do
    tag = HTML::Tag.new("tbody").assign_parameters(@params)
    tag.append_end_tag
    tag.tag_content.include?("</tbody>").should == true
    doc = Nokogiri::XML(tag.to_s)
    doc.errors.should == []
  end

  it "should append a subtag" do 
    tag = HTML::Tag.new("tbody").assign_parameters(@params)
    sub_tag = HTML::Tag.new("tr").assign_parameters(@params[:tbody])
    sub_tag.append_end_tag
    tag.append_sub_tag(sub_tag)
    tag.append_end_tag
    doc = Nokogiri::XML(tag.to_s)
    doc.errors.should == []
  end

  it "should append a subtag when the supertag has its end tag"

  it "should iterate through an array of ids"

end
