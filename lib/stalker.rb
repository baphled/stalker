require "stalker/engine"
module Stalker
  module InstanceMethods
    def follow(user)
      self.following << user
    end
  end

  def self.included(receiver)
    receiver.send :include, InstanceMethods
  end
end
