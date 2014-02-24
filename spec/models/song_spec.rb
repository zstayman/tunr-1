require 'spec_helper'

describe Song do
  it { should belong_to(:artist) }
  it { should have_many(:purchases) }
  
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:artist) }
  it { should validate_presence_of(:price) }
end