require 'rails_helper'

RSpec.describe "BoardReplies", type: :request do
  describe "GET /board_replies" do
    it "works! (now write some real specs)" do
      get board_replies_path
      expect(response).to have_http_status(200)
    end
  end
end
