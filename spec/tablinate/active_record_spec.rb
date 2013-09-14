require 'rails/railtie'
require 'active_record'
require 'spec_helper'
require File.dirname(__FILE__)+"/../../lib/tablinate/adapters/active_record"
describe "An instance of", ActiveRecord::Relation do
  #subject { need to stub out ActiveRecord::Relation somehow }
  describe "#tablinate" do
    before do 
      subject.should_receive(:to_a) 
      Tablinate.should_receive(:generate_table)
    end

    it "should call tablinate and pass itself" do
      subject.tablinate
    end
  end
end
