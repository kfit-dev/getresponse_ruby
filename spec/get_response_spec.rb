require "spec_helper"

RSpec.describe GetResponse, :vcr do
  it { expect(GetResponse::VERSION).not_to be nil }
  let(:email) { 'email@example.com' }

  describe '.configure' do
    before { GetResponse.configure { |config| config.api_key = 'test' } }
    it { expect(GetResponse.config.api_key).to eq('test') }
  end

  before do
    GetResponse.configure do |config|
      config.domain_header = 'myfave.getresponse360.com'
      config.api_key = 'ae3aff891998babfeb4e6919136bf850'
    end
  end

  describe '.contacts' do
    describe '.post' do
      let(:params) do
        {
          name: 'First Name',
          email: email,
          dayOfCycle: '10',
          campaign: {
            campaignId: 'jeqeq1'
          },
          customFieldValues: [
            {
              customFieldId: "n",
              value: [
                "white"
              ]
            }
          ],
          ipAddress: "89.206.36.193"
        }
      end

      subject { GetResponse::Api.contacts.post(params) }
      # it { expect(subject.success?).to be true }
    end

    describe '.get' do
      let(:params) { {} }
      before { @response = GetResponse::Api.contacts.get(params) }
      it { expect(@response.success?).to be true }
      it { expect(@response.body).not_to be_empty }
    end
  end

  describe '.campaigns' do
    let(:params) { {} }
    describe '.get' do
      before { @response = GetResponse::Api.campaigns.get(params) }
      it { expect(@response.success?).to be true }
      it { expect(@response.body).not_to be_empty }
    end
  end
end
