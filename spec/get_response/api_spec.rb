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
end
