require 'spec_helper'

describe Randy::Distributions::Constant do
  subject { Randy::Distributions::Constant.new(10) }
  
  describe "#next" do    
    it "should always return the value provided at creation" do
      subject.next(@lcg).should == 10
      subject.next(@lcg).should == 10
      subject.next(@lcg).should == 10
    end
  end
end