require "rails_helper"

RSpec.describe DrawingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/drawings").to route_to("drawings#index")
    end

    it "routes to #new" do
      expect(:get => "/drawings/new").to route_to("drawings#new")
    end

    it "routes to #show" do
      expect(:get => "/drawings/1").to route_to("drawings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/drawings/1/edit").to route_to("drawings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/drawings").to route_to("drawings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/drawings/1").to route_to("drawings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/drawings/1").to route_to("drawings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/drawings/1").to route_to("drawings#destroy", :id => "1")
    end

  end
end
