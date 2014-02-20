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
      it "should insert all values" do
        subject.attributes = { foo: ["bar", "baz"] } 
        subject.to_s.should eq "<table foo='bar baz'></table>"
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
