require 'open-uri'
require 'nokogiri'

class UrlCrawlerJob < ApplicationJob
  queue_as :default

  def perform(url)
    title = fetch_title_from_url(url)
    Link.find_by(url:).update(title:)
    Rails.logger.info("Title for #{title} updated")
  end

  private

  def fetch_title_from_url(url)
    html = URI.open(url)
    doc = Nokogiri::HTML(html)
    title = doc.at('title')&.text
    title || nil
  rescue OpenURI::HTTPError => e
    "Error fetching title: #{e.message}"
  rescue => e
    "An error occurred: #{e.message}"
  end
end
