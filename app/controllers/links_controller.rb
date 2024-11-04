require "net/http"
require 'uri'

class LinksController < ApplicationController
  def shortener
    return render json: { welcome: "Please add an URL with the prefix '?key=' or shorten URL" }, status: 406 unless params[:key].present?

    if is_shorten_url?
      decoded_link.increment!(:count, 1)
      return redirect_to decoded_link.url, allow_other_host: true
    end

    if url_stored
      UrlCrawlerJob.perform_later(params[:key]) unless url_stored.title
      return render json: { shorten_url: encode_id(url_stored.id) }, status: 200
    end

    if is_url_active?(params[:key])
      new_link = Link.create(url: params[:key])
      UrlCrawlerJob.perform_later(params[:key])
      render json: { shorten_url: encode_id(new_link.id) }, status: 201
    else
      render json: { error_messege: 'URL is not active' }, status: 404
    end

  rescue StandardError
    render json: { error_messege: "Error: try adding '?key=' before URL" }, status: 400
  end

  def top100
    @links = Link.all.order(count: :desc).map { |link| link.slice(:title, :url) }
    render json: { top100: @links }, status: 200
  end

  private

  def is_shorten_url?
    Link.find_by(id: Shortener.bijective_decode(params[:key]))
  end

  def url_stored
    Link.find_by(url: params[:key])
  end

  def decoded_link
    Link.find_by(id: Shortener.bijective_decode(params[:key]))
  end

  def encode_id(id)
    Shortener.bijective_encode(id)
  end

  def is_url_active?(url_string)
    url = URI.parse(url_string)
    req = Net::HTTP.new(url.host, url.port)
    req.use_ssl = (url.scheme == 'https')
    path = url.path if url.path.present?
    res = req.request_head(path || '/')
    res.code != "404"
  rescue Errno::ENOENT, SocketError
    false
  end
end

