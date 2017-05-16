require "spec_helper"

RSpec.describe GetResponse do
  it { expect(GetResponse::VERSION).not_to be nil }
  let(:email) { 'fai@fave.com' }

  describe '.configure' do
    before { GetResponse.configure { |config| config.api_key = 'test' } }
    it { expect(GetResponse.config.api_key).to eq('test') }
  end
end
