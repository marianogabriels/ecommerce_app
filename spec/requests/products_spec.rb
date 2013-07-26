require 'spec_helper'

describe "Products" do
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

  describe "creando productos" do
    before { visit new_product_path }
    it "despliegue correcto de formulario" do 
      page.should have_content("Description")
    end
  end
end
