class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  # 
  validates :title, uniqueness: { message: 'has already been taken' }, 
                    length: { minimum: 10, message: "debe ser mayor de 10 caracteres"  }
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)$}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }


end
