require 'spec_helper'

describe "An instance of", Array do
  subject do
    [
      { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
      { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
      { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
      { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' }
    ]
  end

  describe "#tablinate" do
    before do
      Tablinate.should_receive(:generate_table)  do |objects, params|
        objects.should == subject
      end
    end

    it "should call generate_table and pass itself and pass the params" do
      subject.tablinate
    end
  end
end
