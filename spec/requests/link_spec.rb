# frozen_string_literal: true

require 'rails_helper'
require 'base64'

RSpec.describe LinksController, type: :request do
  let!(:exisiting_link) { FactoryBot.create(:link) }

  describe "GET /:url" do
    it 'returns the existing link' do
      get root_path, params: {url: exisiting_link.url}
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['slug']).to eq(exisiting_link.slug)
    end

    it 'creates a new link if it does not exist' do
      new_url = "http://new-url.com"
      expect {
        get root_path, params: {url: new_url}
      }.to change(Link, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['slug']).to_not be_nil
    end
  end
end
