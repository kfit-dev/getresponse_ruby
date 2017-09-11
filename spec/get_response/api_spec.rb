require 'spec_helper'

RSpec.describe GetResponse::Api do
  let(:api) { GetResponse::Api.new }

  before do
    stub_request(:get, "https://api3.getresponse360.com/v3/contacts").
      to_return(status: 200, body: "", headers: {})
    stub_request(:get, "https://api3.getresponse360.com/v3/contacts/1").
      to_return(status: 200, body: "", headers: {})
    stub_request(:get, "https://api3.getresponse360.com/v3/custom-fields").
      to_return(status: 200, body: "", headers: {})
    stub_request(:get, "https://api3.getresponse360.com/v3/campaigns").
      to_return(status: 200, body: "", headers: {})
    stub_request(:post, "https://api3.getresponse360.com/v3/products").
      to_return(status: 429, body: "", headers: {"x-ratelimit-reset" => "600 seconds"})
  end

  describe '#contacts' do
    it { expect(api.contacts.retrieve.success?).to be true }
    it { expect(api.contacts('1').retrieve.success?).to be true }
  end

  describe '#campaigns' do
    it { expect(api.campaigns.retrieve.success?).to be true }
  end

  describe '#custom_fields' do
    it { expect(api.custom_fields.retrieve.success?).to be true }
  end

  describe 'limitted requests' do
    let(:result) { api.products.create({}) }
    it { expect(result.success?).to be false }
    it { expect(result.rate_limitted?).to be true }
    it { expect(result.rate_limit_reset_time).to eq 600 }
  end
end
