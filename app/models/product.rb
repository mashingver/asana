class Product < ActiveRecord::Base

  validates :title, :length, :width, :thickness, :diameter, :capacity,
            :weight, :color, :material, :extender, :manufacturer,
            :description, :image_url, :price, presence: true

  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|jpeg|png)\Z}i,
      message: 'must be a URL for GIF, JPG, JPEG or PNG image.'
  }

end
