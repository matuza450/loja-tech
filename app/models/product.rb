class Product < ApplicationRecord
  has_many_attached :images
  validates :images, presence: true
  validate :image_type
  
  private
  
  def image_type
    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image/png image/jpg'))
        errors.add(:images, 'needs to be a JPEG, JPG or PNG')
      end
    end
  end
end
