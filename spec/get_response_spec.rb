require "spec_helper"

RSpec.describe GetResponse, :vcr do
  it { expect(GetResponse::VERSION).not_to be nil }
  let(:email) { 'fai@fave.com' }

  describe '.configure' do
    before { GetResponse.configure { |config| config.api_key = 'test' } }
    it { expect(GetResponse.config.api_key).to eq('test') }
  end

  before do
    GetResponse.configure do |config|
      config.domain_header = 'domain.header'
      config.api_key = '123'
    end
  end

  describe '.contacts' do
    describe '.post' do
      let(:params) do
        {
          name: 'Fai Zeck',
          email: email,
          dayOfCycle: '10',
          campaign: {
            campaignId: 'O'
          },
          customFieldValues: [
            {
              customFieldId: "P",
              value: [
                "Malaysia"
              ]
            }
          ],
          ipAddress: "89.206.36.193"
        }
      end

      subject { GetResponse::Api.new.contacts.create(params) }
      it { expect(subject.success?).to be true }
    end

    describe '.get' do
      subject { GetResponse::Api.new.contacts.retrieve }
      it { expect(subject.success?).to be true }
      it { expect(subject.body).not_to be_empty }
    end
  end

  describe '.campaigns' do
    describe '.get' do
      subject { GetResponse::Api.new.campaigns.retrieve }
      it { expect(subject.success?).to be true }
      it { expect(subject.body).not_to be_empty }
    end
  end

    describe '.campaigns' do
    describe '.get' do
      subject { GetResponse::Api.new.campaigns.retrieve }
      it { expect(subject.success?).to be true }
      it { expect(subject.body).not_to be_empty }
    end
  end

  describe '.custom_fields' do
    describe '.get' do
      subject { GetResponse::Api.new.custom_fields.retrieve }
      it { expect(subject.success?).to be true }
      it { expect(subject.body).not_to be_empty }
    end
  end
end
