require 'spec_helper'

class DummyClass
  extend Head
end

describe "table", Head do
  subject { DummyClass }

  context "given params" do
    it "should construct the table head" do
      subject.build_head(objects[0], params).class.should == Tag
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
