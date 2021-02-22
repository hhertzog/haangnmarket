class Notification < ApplicationRecord
  belongs_to :recipient
  belongs_to :poster
  belongs_to :post
end
