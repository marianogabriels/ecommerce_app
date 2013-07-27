require 'spec_helper'

describe "Productos:" do
  describe "GET /products" do
    it "works! (now write some real specs)" do
      get products_path
      response.status.should be(200)
    end
  end

  describe "GET new_product_path"  do
    it "huehuehue" do
      get new_product_path
      response.status.should be(200)
    end
  end

  describe "ingreso de productos" do
    before { visit new_product_path }
    it "por algun lado debe desplegar algun formulario (monkeytest)" do 
      page.should have_content("Description")
      page.should have_selector('textarea')
    end

    describe ". Ingresar un producto con todos sus atributos vacios" do
      before do
        fill_in "Title", with: ""
        fill_in "Description", with: ""
        fill_in "Image url", with: ""
        fill_in "Price", with: ""
        @product = Product.new
        @product.save
      end

      it "no debe crear un producto" do
        expect { click_button "Create Product" }.not_to change(Product, :count)
      end

      it "debe mostrar errores" do
        click_button "Create Product" 
        @product.errors.full_messages.each do |error| 
          page.should have_content(error)
        end
      end
    end
  end
end
