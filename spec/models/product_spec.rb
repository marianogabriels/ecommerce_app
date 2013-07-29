require 'spec_helper'

describe Product do

  it "la validacion falla si el titulo no es unico" do
    FactoryGirl.create(:product)
    product_with_same_title = FactoryGirl.build(:product)
    product_with_same_title.should_not be_valid
    product_with_same_title.should have(1).error_on(:title)
  end
end
