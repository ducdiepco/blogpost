require 'rails_helper'

RSpec.describe PostSerializer do
  let!(:post) { create(:post) }

  it 'returns post' do
    serializer = described_class.new post
    hash_result = serializer.serializable_hash
    expect(hash_result[:title]).to eq 'test title'
    expect(hash_result[:body]).to eq 'test body'
  end
end
