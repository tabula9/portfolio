class Favorite < ApplicationRecord
  belongs_to :user
  has_many :favorites_genres, dependent: :destroy
  has_many :genres, through: :favorites_genres
  has_many :favorites_notgenres, dependent: :destroy
  has_many :not_genres, through: :favorites_notgenres
  has_many :favorites_buntais, dependent: :destroy
  has_many :buntais, through: :favorites_buntais
  belongs_to :order, primary_key: 'parameters', foreign_key: 'order_parameters'
  validate :min_max_check

  def min_max_check
    a = kaiwaritu_min || 1
    b = kaiwaritu_max || 1
    c = min_firstup || 1
    d = max_firstup || 1
    if a > b
      errors.add(:kaiwaritu_max, "が最小値より小さくなっています。")
    end
    if c > d
      errors.add(:max_firstup, "が期間指定の開始日より前の日付になっています。")
    end
  end
end
