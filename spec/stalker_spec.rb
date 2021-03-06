require "spec_helper"

class User
  include Stalker
  include Mongoid::Document

  field :username

  has_and_belongs_to_many :followers, :autosave => true, :dependent => true, :class_name => 'User', :inverse_of => :following
  has_and_belongs_to_many :following, :autosave => true, :dependent => true, :class_name => 'User', :inverse_of => :followers
end

describe Stalker do
  let(:harry) { User.create(username: 'harry') }
  let(:sally) { User.create(username: 'sally') }

  describe "follow" do
    it "lets a user following another user" do
      harry.follow(sally)
      harry.following.count.should eql 1
      harry.following.first.should eql sally
    end

    it "the follow should be set to following the new user" do
      harry.follow(sally)
      sally.followers.count.should eql 1
    end
  end

  describe "following" do

    it "has access to the people the stalker is following" do
      harry.follow(sally)
      harry.following.should_not be_empty
    end

    it "displays the number of people the user is following" do
      harry.follow(sally)
      harry.following.count.should == 1
    end

    it "displays the number of people following the user" do
      harry.follow(sally)
      sally.followers.count.should == 1
    end
  end

  describe "unfollow" do
    it "should remove the followed person from the following list" do
      harry.unfollow(sally)
      sally.followers.count.should eql 0
    end

    it "should remove the users from the stalked followers list" do
      harry.unfollow(sally)
      sally.following.count.should eql 0
    end
  end
end
