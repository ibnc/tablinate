require 'spec_helper'

class DummyClass
  extend Head
end

describe "table", Head do
  subject { DummyClass }

  context "given params" do
    it "should construct the table head" do
      thead = subject.build_head(objects[0].keys, params)
      thead.class.should == Tag
      thead.tag_content.scan(/<[a-zA-Z ]+=\'.*+/).each do |tag|
        tag_name = tag.scan(/[a-zA-Z]+/)
        Tag.new(tag_name).tag_name.should == tag_name
      end
    end

    it "should construct the table head rows" do
      subject.build_head_rows(objects[0], params[:thead]).class.should == Tag
    end
  end
  
  context "without params" do
    it "should construct the table head" do
      subject.build_head(objects[0]).class.should == Tag
    end

    it "should construct the table head rows" do
      subject.build_head_rows(objects[0]).class.should == Tag
    end
  end
end
