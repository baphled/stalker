require "stalker/engine"
module Stalker
  module InstanceMethods
    def follow(user)
      follower = User.find(user.id)
      self.following << follower
    end
  end

  def self.included(receiver)
    receiver.send :include, InstanceMethods
  end
end
