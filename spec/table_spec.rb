require 'spec_helper'

describe "An instance of", Table do
  let(:values) { [{foo: "bar", bar: "baz"}] }
  subject { Table.new(values, {}) }

  it "should build the table with children elements" do
    subject.to_s.should eq "<table><thead><tr><th>foo</th> <th>bar</th></tr></thead> <tbody><tr><td>bar</td> <td>baz</td></tr></tbody></table>"
  end
end

