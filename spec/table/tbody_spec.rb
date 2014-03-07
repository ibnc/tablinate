require 'spec_helper'

class DummyClass
  extend Tbody
end

describe "table", Tbody do
  subject { DummyClass }

  context "given params" do
    #TODO rewrite this test it sucks, but it ensures we keep building it right.
    it "should construct the table body" do
      body = subject.build_body(objects, params[:tbody])
      body.to_s.should eq(  
        "<tbody><tr class='class1' id='id-2'><td class='rawr' id='1' foo='bar'>value1</td><td class='rawr' id='2' foo='bar'>value2</td><td class='rawr' id='3' foo='bar'>value3</td></tr><tr class='class2' id='id-2'><td class='rawr' id='1' foo='bar'>value1</td><td class='rawr' id='2' foo='bar'>value2</td><td class='rawr' id='3' foo='bar'>value3</td></tr><tr class='class3' id='id-2'><td class='rawr' id='1' foo='bar'>value1</td><td class='rawr' id='2' foo='bar'>value2</td><td class='rawr' id='3' foo='bar'>value3</td></tr><tr class='class1' id='id-2'><td class='rawr' id='1' foo='bar'>value1</td><td class='rawr' id='2' foo='bar'>value2</td><td class='rawr' id='3' foo='bar'>value3</td></tr></tbody>")
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
