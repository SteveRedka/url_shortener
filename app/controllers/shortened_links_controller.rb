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
    @short_anchor = request.url + @shortened_link.short_url
  end

  def show
    @shortened_link = ShortenedLink.find_by(short_url: params[:short_url])
    if @shortened_link
      redirect_to @shortened_link.full_url
    else
      redirect_to "https://duckduckgo.com/?q=#{params[:short_url]}"
    end
  end

  def edit
    @shortened_link = ShortenedLink.find(shortened_link_params[:id])
  end

  def update
    @shortened_link = ShortenedLink.find(shortened_link_params[:id])
    unless ShortenedLink.find_by(short_url: params[:short_url]).nil?
      flash[:error] = 'This short url already exists!'
      render 'edit'
      return
    end

    if @shortened_link.update_attributes(short_url: shortened_link_params[:short_url])
      flash[:success] = 'link updated!'
      render 'link_info'
    else
      flash[:error] = @shortened_link.errors
      render 'edit'
    end
  end

  def index
  end

  private

  def shortened_link_params
    params.require(:shortened_link).permit(:full_url, :short_url, :id)
  end
end
