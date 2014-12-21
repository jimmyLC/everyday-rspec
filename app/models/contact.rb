class Contact < ActiveRecord::Base
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates :email, presence: true,
                    uniqueness: true
  validates :phones, length: { is: 3 }
  has_many :phones

  def name
    [firstname, lastname].join(' ')
  end
end
