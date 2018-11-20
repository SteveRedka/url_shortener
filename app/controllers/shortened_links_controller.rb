class ShortenedLinksController < ApplicationController
  def create
    @shortened_link = ShortenedLinkCreator.new(shortened_link_params[:full_url])
                                          .call
    render 'link_info'
  end

  def new
    @shortened_link = ShortenedLink.new
  end

  def link_info
  end

  def show
    @shortened_link = ShortenedLink.find_by(short_url: params[:short_url])
    if @shortened_link
      redirect_to @shortened_link.full_url
    else
      redirect_to "https://duckduckgo.com/?q=#{params[:short_url]}"
    end
  end

  def index
  end

  private

  def shortened_link_params
    params.require(:shortened_link).permit(:full_url)
  end
end
