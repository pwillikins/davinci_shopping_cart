require 'spec_helper'

describe LineItem do
  it { should belong_to(:product) }
  it { should belong_to(:cart) }
end
