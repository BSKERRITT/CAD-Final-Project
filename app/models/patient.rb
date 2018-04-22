class Patient < ApplicationRecord
  belongs_to :user
  has_many :records
  has_many :appointments

  def self.search(search)
    if search
      where(["name LIKE ?", "%#{search}%"])
    else
      all
    end
  end
end
