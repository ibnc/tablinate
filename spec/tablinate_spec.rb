require 'spec_helper'

describe Tablinate do
  let(:objects) do
    [
      { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
      { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
      { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
      { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' }
    ]
  end

  let(:params) do 
     { 
      :table => { :class => "eek", :id => 'rawr' },
      :tbody => {
        :tr => { :class => [ 'class1', 'class2', 'class3' ], :id => 'id-2' },
        :td => { :class => 'rawr', :id => [1,2,3], :foo => :bar }
      }
    }
  end

  subject { Tablinate }

  context "given an array of hashes" do
    context "and a params hash" do
      it "should genderate an html table" do
        table =  subject.generate_table(objects, params)
        #using nokogiri to ensure the markup is correct
        doc = Nokogiri::XML(table.to_s)
        doc.errors.should == []
      end
    end

    context "and no a params hash" do
      it "should generate an html table" do
        table = subject.generate_table(objects)
        doc = Nokogiri::XML(table.to_s)
        doc.errors.should == []
      end
    end
  end

  context "given an ActiveRecord::Relation" do
    let(:ar_objects) { ActiveRecord::Relation.new }

    before do
      ActiveRecord::Relation.any_instance.stub(:collect) { objects }
    end

    context "and a params hash" do
      it "should genderate an html table" do
        table = subject.generate_table(ar_objects, params)
        #using nokogiri to ensure the markup is correct
        doc = Nokogiri::XML(table.to_s)
        doc.errors.should == []
      end
    end

    context "and no a params hash" do
      it "should generate an html table" do
        table = subject.generate_table(ar_objects)
        doc = Nokogiri::XML(table.to_s)
        doc.errors.should == []
      end
    end
  end

  context "given a JSON hash" do
    context "and a params hash" do
      it "should generate an html table" do
        table = subject.generate_table(objects.to_json, params)
        doc = Nokogiri::XML(table.to_s)
        doc.errors.should == []
      end
    end

    context "and no params" do
      it "should generate an html table" do
        table = subject.generate_table(objects.to_json)
        doc = Nokogiri::XML(table.to_s)
        doc.errors.should == []
      end
    end
  end
end
