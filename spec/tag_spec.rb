require 'spec_helper'

describe "An instance of", Tag do

  describe "#new" do
    subject { Tag }

    it "should init an empty tag" do
      subject.new("name").tag_content.should == "<name>"
    end
  end 

  describe "#<<" do
    subject { Tag.new("table") }
    
    context "given an array" do
      it "should pass each element to self" do
        array = [ 1,2,2,4 ]
        subject << array
        subject.to_s.include?(array.join).should == true
      end
    end

    context "given a string" do
      it "should append the string" do
        subject << "string"
        subject.to_s.include?("string").should == true
      end
    end

    context "given a Tag" do
      it "should append as a sub_tag" do
        sub_tag = Tag.new("tbody")
        subject << sub_tag
        subject.to_s.include?(sub_tag.tag_name).should == true
      end
    end
  end

  describe "#assign_parameters" do
    subject { Tag.new("tr") }

    context "given params" do
      it "should append the html params" do
        tag = subject.assign_parameters(params[:tbody])
        params[:tbody][:tr].keys.map do |key|
          tag.tag_content.include?("#{key.to_s}=").should == true
        end
      end
      
      it "should iterate through an array of ids" do 
        offset = 0
        params[:tbody][:tr][:class].each do |klass|
          tag = subject.assign_parameters(params[:tbody], offset)
          tag.tag_content.include?("class='#{klass}'").should == true
          offset += 1
        end
      end
    end
    
    context "without params" do
      it "should do nothing" do
        subject.assign_parameters.should == subject
      end
    end
  end
end
