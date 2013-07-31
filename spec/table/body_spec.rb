require 'spec_helper'

class DummyClass
  extend Body
end

describe "table", Body do
  subject { DummyClass }

  context "given params" do
    it "should construct the table body" do
      subject.build_body(objects, params[:tbody]).class.should == Tag
    end

    it "should construct the table rows" do
      rows = subject.build_body_rows(objects, params[:tbody])
      rows.class.should == Array
      rows.each { |row| row.class.should == Tag }
    end

    it "shoulid construct the entries for a row" do
      entries = subject.build_row_entries(objects[0], params[:tbody])
      entries.class.should == Array
      entries.each { |entry| entry.class.should == Tag }
    end
  end
  
  context "without params" do
    it "should construct the table body" do
      subject.build_body(objects).class.should == Tag
    end

    it "should construct the table rows" do
      rows = subject.build_body_rows(objects)
      rows.class.should == Array
      rows.each { |row| row.class.should == Tag }
    end

    it "shoulid construct the entries for a row" do
      entries = subject.build_row_entries(objects[0])
      entries.class.should == Array
      entries.each { |entry| entry.class.should == Tag }
    end
  end
end
