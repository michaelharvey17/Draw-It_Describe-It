require 'rails_helper'

RSpec.describe "Drawings", type: :request do
  describe "GET /drawings" do
    it "works! (now write some real specs)" do
      get drawings_path
      expect(response).to have_http_status(200)
    end
  end
end
