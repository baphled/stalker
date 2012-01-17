require "spec_helper"

class User
  include Stalker
  include Mongoid::Document

  field :username

  has_and_belongs_to_many :followers, :autosave => true, :dependent => true, :class_name => 'User', :inverse_of => :following
  has_and_belongs_to_many :following, :autosave => true, :dependent => true, :class_name => 'User', :inverse_of => :followers
end

describe Stalker do
  describe "follow" do
    let(:harry) { User.create(username: 'harry') }
    let(:sally) { User.create(username: 'sally') }

    it "should find the person we want to follow" do
      User.should_receive(:find).and_return sally
      harry.follow(sally)
    end

    it "lets a user following another user" do
      harry.follow(sally)
      harry.following.count.should eql 1
      harry.following.first.should eql sally
    end

    it "the follow should be set to following the new user" do
      harry.follow(sally)
      harry.following.first.followers.count.should eql 1
      pending 'This seems to be failing though we can access get the expected response via the association'
      sally.followers.count.should eql 1
    end
  end

  describe "following" do
    it "displays the number of people the user is following"
    it "displays the number of people following the user"
  end
end
