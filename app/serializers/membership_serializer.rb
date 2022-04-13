class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :charge, :gym_id, :client_id
  has_one :gym
  has_one :client

end
