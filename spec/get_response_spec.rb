require "spec_helper"

RSpec.describe GetResponse do
  it { expect(GetResponse::VERSION).not_to be nil }
  let(:email) { 'email@example.com' }

  describe '.configure' do
    before { GetResponse.configure { |config| config.api_key = 'test' } }
    it { expect(GetResponse.config.api_key).to eq('test') }
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

      it { expect(GetResponse::Api.contacts.post(params)).not_to be nil }
    end

    describe '.get' do
      let(:params) do
        {
          "query[email]" => email
        }
      end
      it { expect(GetResponse::Api.contacts.get(params)).not_to be nil }
    end
  end
end
