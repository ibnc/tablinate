require 'spec_helper'

class DummyClass
  extend Body
end

describe "table", Body do
  subject { DummyClass }

  context "given params" do
    it "should construct the table body" do
      body = subject.build_body(objects, params[:tbody])
      body.class.should == Tag
      body.to_html.scan(/<([a-zA-Z]+) ([a-zA-Z]+=\'.*?\'+)>/).each do |tag|
        name = tag[0]
        next if name == "tbody"
        params[:tbody][name.to_sym].each do |param, value|
          if value.class == Array then
            tag[1].include?("#{param.to_s}=\'#{value.join(" ")}\'").should be_true
          else
            tag[1].include?("#{param.to_s}=\'#{value}\'").should == true
          end
        end
      end
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
