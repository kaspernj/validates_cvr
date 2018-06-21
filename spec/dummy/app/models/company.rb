class Company < ApplicationRecord
  validates :vat_number, cvr: true
end
