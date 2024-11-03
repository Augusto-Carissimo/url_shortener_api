# frozen_string_literal: true

require 'rails_helper'
require 'base64'

RSpec.describe LinksController, type: :request do
  let!(:exisiting_url) { FactoryBot.create(:link) }
  let!(:shorten_existing_url) { Shortener.bijective_encode(exisiting_url.id) }

  describe "GET /:url" do
    it 'returns stored url' do
      get root_path, params: { key: exisiting_url.url }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['shorten_url']).to eq(shorten_existing_url)
    end

    it 'creates a new link if it does not exist' do
      new_url = "https://example.com/"
      expect {
        get root_path, params: { key: new_url }
      }.to change(Link, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['shorten_url']).to_not be_nil
    end

    it 'checks if url is alive' do
      dead_url = "https://dead.url/"
      expect {
        get root_path, params: { key: dead_url }
      }.not_to change(Link, :count)
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['error_messege']).to eq('URL is not active')
    end

    it 'handles empty params' do
      get root_path
      expect(response).to have_http_status(:not_acceptable)
      expect(JSON.parse(response.body)['not_acceptable']).to eq('Please add an url or shorten url')
    end
  end
end
