require 'rails_helper'

RSpec.describe PostsQuery  do

  let(:query_object) do
    described_class.new(initial_scope: initial_scope, params: params)
  end

  let(:params) {}
  let(:initial_scope) {}

  describe '#all' do
    subject(:all) { query_object.all }
    let(:params) { { sort: 'desc' }}
    let(:initial_scope) { Post.published }

    let!(:posts) do
      [create(:post, created_at: Time.zone.now - 1.day), create(:post, created_at: Time.zone.now )]
    end

    let!(:unpublish_post) {create(:post, published: false, created_at: Time.zone.now - 2.day)}

    it 'returns published sorted posts' do
      expect(all.to_sql).to include('WHERE "posts"."published" = 1 ORDER BY created_at desc')
      expect(all).to eq posts.reverse
      expect(all.count).to eq 2
    end
  end

  describe '#find_by_id_with_user' do
    let(:post) { create(:post) }
    let(:params) { { id: post.id }}

    subject(:find_by_id_with_user) { query_object.find_by_id_with_user }

    it 'returns post' do
      expect(find_by_id_with_user).to eq(post)
    end
  end
end
