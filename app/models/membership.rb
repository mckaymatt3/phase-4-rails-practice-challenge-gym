class Membership < ApplicationRecord

    belongs_to :client
    belongs_to :gym

    validates :charge, presence: true, :inclusion => 5...50
    validates :gym_id, presence: true
    validates :client_id, presence: true

end
