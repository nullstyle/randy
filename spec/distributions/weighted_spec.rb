require 'spec_helper'

describe Randy::Distributions::Weighted do
  let(:rng){ Randy::Rng::Dummy.new(1000, [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.999])}
  subject { Randy::Distributions::Weighted.new({:red => 1, :blue => 9}) }
  
  describe "#next" do    
    it "should always return the value provided at creation" do
      subject.next(rng).should == :blue
      subject.next(rng).should == :blue
      subject.next(rng).should == :blue
      subject.next(rng).should == :blue
      subject.next(rng).should == :blue
      subject.next(rng).should == :blue
      subject.next(rng).should == :blue
      subject.next(rng).should == :blue
      subject.next(rng).should == :red

    end
  end
end