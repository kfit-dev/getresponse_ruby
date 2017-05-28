require "spec_helper"

RSpec.describe GetResponse do
  it { expect(GetResponse::VERSION).not_to be nil }
  let(:email) { 'fai@fave.com' }
  let(:logger) { Logger.new(STDOUT) }

  describe '.configure' do
    before do
      GetResponse.configure do |config|
        config.api_key = 'test'
        config.verbose = true
        config.logger  = logger
      end
    end
    it { expect(GetResponse.config.api_key).to eq('test') }
    it { expect(GetResponse.config.verbose).to be true }
    it { expect(GetResponse.config.logger).to eq(logger) }
  end
end
