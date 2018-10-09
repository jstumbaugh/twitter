require "rails_helper"

RSpec.describe "Status API", type: :request do
  let!(:statuses) { create_list(:status, 3) }
  let(:status_id) { statuses.first.id }

  describe "GET /statuses" do
    before { get "/api/v1/statuses" }

    it "returns all the statuses" do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /statuses/:id" do
    before { get "/api/v1/statuses/#{status_id}" }

    context "when the record exists" do
      it "returns the status" do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(status_id)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:status_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Status/)
      end
    end
  end

  describe "DELETE /statuses/:id" do
    before { delete "/api/v1/statuses/#{status_id}" }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
