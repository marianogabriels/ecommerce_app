require 'spec_helper'

describe "LineItems. " do
    let(:product) { FactoryGirl.create(:product) }

    describe "el store, cuando un usuario visita el index " do
      before { visit store_index_path }
      subject { page }
      it { should have_content("Pragmatic") }
      it { should have_selector( 'h1' ,  "Your Pragmatic Catalog") }
      it { should have_title("EcommerceApp") }
      it { should have_selector( 'h3' , product.title ) } 
      it { should have_selector('h1') }
    end

#    describe "agregar al carrito un producto" do
#      before { click_button "agregar al carro" }
#      it { should have_content('Line') }
#    end
end
