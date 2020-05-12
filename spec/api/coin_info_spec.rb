# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::Api::CoinResource do
  describe "coin_info" do
    let(:symbol) { "CAPITAL" }
    it "return coin info" do
      client = Minter::Api::Client.new
      response = client.coin_info(symbol: symbol, height: 1)
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      expect(response.body["result"]).not_to be_nil
      %w[name symbol volume crr reserve_balance max_supply].each do |key|
        expect(response.body["result"][key]).not_to be_nil
      end
    end
  end
end
