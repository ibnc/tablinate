require 'spec_helper'

describe "An instance of", Table do
  subject { Table.new }
  it { should respond_to :build_head }
  it { should respond_to :build_body }

  it "should initialize an empty table tag" do
    Tag.should_receive(:assign_parameters)
    Tag.should_receive(:new).with("table") { Tag }
    subject
  end

  it "should build the table structure" do
    subject.instance_variable_set(:@table, Tag.new("table"))
    Tag.any_instance.should_receive(:<<).exactly(2)
    Tag.any_instance.should_receive(:append_end_tag)
    subject.build_structure()
  end

  context "given params" do
    it "should build the table elements" do
      subject.should_receive(:build_head) 
      subject.should_receive(:build_body) 
      subject.build_elements(objects, params)
    end
  end

  context "without params" do
    it "should build the table elements" do
      subject.should_receive(:build_head) 
      subject.should_receive(:build_body) 
      subject.build_elements(objects)
    end
  end
end

