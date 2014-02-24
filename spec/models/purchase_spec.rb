require 'spec_helper'

describe Purchase do
  it { should validate_presence_of(:song) }
  it { should validate_presence_of(:user) }
end
