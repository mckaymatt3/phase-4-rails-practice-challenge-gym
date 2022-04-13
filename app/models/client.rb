class Client < ApplicationRecord

    has_many :memberships
    has_many :gyms, through: :memberships

    validates :name, presence: true
    validates :age, presence: true, :inclusion => 18...100

end
