class Book < ApplicationRecord
  belongs_to :author
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres
  
  has_one_attached :cover_image

  validates :title, presence: true
  validate :valid_title?



  def valid_title?
    return !(title == nil || title.strip.empty?)
  end

  def allgenres
    genres.map { |genre| genre.name }.join(", ")
  end

end
