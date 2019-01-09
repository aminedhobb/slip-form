class Answer < ApplicationRecord

  validates :customer_name, presence: true
  validates :customer_mail, presence: true
  validates :satisfaction_rating, presence: true, inclusion: 1..10
  validates :shipping_rating, presence: true, inclusion: 1..10
  validates :products_quality_rating, presence: true, inclusion: 1..5

end
