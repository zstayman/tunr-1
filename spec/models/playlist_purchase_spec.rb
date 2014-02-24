require 'spec_helper'

describe PlaylistPurchase do
  it { should validate_presence_of(:playlist) }
  it { should belong_to(:playlist) }
  it { should validate_presence_of(:purchase) }
  it { should belong_to(:purchase) }
end