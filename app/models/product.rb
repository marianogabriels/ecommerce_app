class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  # 
  validates :title, uniqueness: { message: 'has already been taken' }, 
                    length: { minimum: 10, message: "debe ser mayor de 10 caracteres"  }
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)$}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }




  private

  #se asegura de que el Producto no está asignado
  # a ninguna linea de item
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
