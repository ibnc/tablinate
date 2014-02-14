require 'spec_helper'

describe Tag do
  subject{ Tag.new("table") }

  describe ".new" do
    it "should assign all instance variables" do
      subject.instance_variable_get(:@name).should eq :table
      subject.instance_variable_get(:@attributes).should eq Hash.new
      subject.instance_variable_get(:@children).should eq Array.new
      subject.instance_variable_get(:@text).should eq ""
    end
  end

  describe ".to_s" do
    it "should return tag and sub tags as string" do
      subject.children << Tag.new("thead") 
      subject.to_s.should eq "<table><thead></thead></table>"
    end

    it "should insert text in between open and close tags." do
      subject.text = "testing"
      subject.to_s.should eq "<table>testing</table>"
    end

    context "when an attribute's value is a string" do
      it "should insert attributes in opening tag" do
        subject.attributes = { foo: "bar" } 
        subject.to_s.should eq "<table foo='bar'></table>"
      end
    end

    context "when an attribute's value is an array" do
      subject { Tag.new("tr") }
      let(:attributes) { { foo: ["bar", "barz"] } }

      it "should iteratively assign the corresponding value" do
        tbody = Tag.new("tbody")
        attributes[:foo].length.times do 
          tr = subject
          tr.attributes = attributes
          tbody.children << tr
        end

        attributes[:foo].each do |value|
          tbody.to_s.include?("<tr foo='#{value}'>").should be_true
        end
      end
    end
  end

  describe ".html" do
    it "should return tag and sub tags as formatted string" do
      subject.children << Tag.new("thead") 
      subject.to_html.should eq "<table>\n<thead>\n</thead>\n</table>\n"
    end
  end
end

