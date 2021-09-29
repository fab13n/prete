class Good < ApplicationRecord
  belongs_to :user
  has_many :loans
  has_one_attached :picture
end
