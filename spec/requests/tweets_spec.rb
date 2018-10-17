require "rails_helper"

RSpec.describe "Tweet API", type: :request do
  let!(:tweets) { create_list(:tweet, 3) }
  let(:tweet_id) { tweets.first.id }

  describe "GET /tweets" do
    before { get "/api/v1/tweets" }

    it "returns all the tweets" do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /tweets/:id" do
    before { get "/api/v1/tweets/#{tweet_id}" }

    context "when the record exists" do
      it "returns the tweet" do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(tweet_id)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:tweet_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Tweet/)
      end
    end
  end

  describe "DELETE /tweets/:id" do
    before { delete "/api/v1/tweets/#{tweet_id}" }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
