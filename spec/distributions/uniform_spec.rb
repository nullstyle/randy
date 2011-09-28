require 'spec_helper'

describe Randy::Distributions::Uniform, "created with a Range" do

  subject { Randy::Distributions::Uniform.new(1...10) }
  
  describe "#next" do    
    it "should never return a value outside the range" do
      100.times do
        subject.next.should be_between(1,10)
      end
    end
  end
end

describe Randy::Distributions::Uniform, "created with an Array" do

  subject { Randy::Distributions::Uniform.new([:foo, :bar, :baz]) }
  
  describe "#next" do    
    it "should never return a value outside the range" do
      100.times do
        subject.next.should satisfy{|i| [:foo, :bar, :baz].include?(i)}
      end
    end
  end
end