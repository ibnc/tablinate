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
      thead.to_html.scan(/<([a-zA-Z]+) ([a-zA-Z]+=\'.*?\'+)>/).each do |tag|
        name = tag[0]
        next if name == "thead"
        params[:thead][name.to_sym].each do |param, value|
          if value.class == Array then
            value.map do |v| 
              tag[1].include?("#{param.to_s}=\'#{v}\'")
            end.include?(true).should be_true
          else
            tag[1].include?("#{param.to_s}=\'#{value}\'").should == true
          end
        end
      end
    end

    it "should construct the table head rows" do
      head_rows = subject.build_head_rows(objects[0], params[:thead])
      head_rows.class.should == Tag
      head_rows.name.should == :tr
    end
  end
  
  context "without params" do
    it "should construct the table head" do
      head = subject.build_head(objects[0])
      head.class.should == Tag
      head.name.should == :thead
    end

    it "should construct the table head rows" do
      head_rows = subject.build_head_rows(objects[0])
      head_rows.class.should == Tag
      head_rows.name.should == :tr
    end
  end
end
