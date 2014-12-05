class Product < ActiveRecord::Base

  has_many :line_items
  has_many :orders, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item  #Подключаемым называется такой метод, который Rails вызывает автоматически
                                                          #в определенный момент жизни объекта. В данном случае метод будет вызван перед
                                                          #тем, как Rails попытается удалить строку в базе данных. Если подключаемый метод
                                                          #возвращает false, строка не будет удалена.

  validates :title, :length, :width, :thickness, :diameter, :capacity,
            :weight, :color, :material, :extender, :manufacturer,
            :description, :image_url, :price, presence: true

  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }
  #validates :title, length: {within: [10..255]}

  def self.latest
    Product.order(:updated_at).last
  end

  private

  # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'существуют товарные позиции')
      return false
    end
  end

end
