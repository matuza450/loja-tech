class Product < ApplicationRecord
<<<<<<< HEAD
  has_many_attached :images
  validates :images, presence: true
  validate :image_type
  
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def average_rating
    return 0 if reviews.empty?
    reviews.average(:rating).to_f.round(2)
  end
  
  private
  
  def image_type
    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image/png image/jpg'))
        errors.add(:images, 'needs to be a JPEG, JPG or PNG')
      end
    end
  end
=======
>>>>>>> parent of df2f121 (UPDATE)
end
