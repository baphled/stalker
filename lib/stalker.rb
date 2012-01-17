require "stalker/engine"
module Stalker
  module InstanceMethods
    def follow(user)
      self.following << user
    end

    def unfollow user
     self.following.delete(user)
    end
  end

  def self.included(receiver)
    receiver.send :include, InstanceMethods
  end
end
