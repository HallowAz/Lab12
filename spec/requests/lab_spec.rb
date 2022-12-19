require 'rails_helper'

RSpec.describe "Labs", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get "/lab/input"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/lab/show"
      expect(response).to have_http_status(:success)
    end
  end

end
