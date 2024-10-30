class LinksController < ApplicationController
  def index
    unless params[:url].present?
      render json: { welcome_message: "welcome message" }, status: :ok
      return
    end

    if link = Link.find_by(slug: params[:url])
      render json: {slug: link.slug}, status: :ok
    elsif link = Link.find_by(url: params[:url])
      render json: {slug: link.slug}, status: :ok
    else
      link = Link.create(url: params[:url], slug: encode)
      render json: { slug: link.slug }, status: :created
    end
  end

  private

  def encode
    (0...10).map { (65 + rand(26)).chr }.join
  end
end

