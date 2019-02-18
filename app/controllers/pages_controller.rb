class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
    Mapbox.access_token = "pk.eyJ1IjoibmljaG9oZWxtdXQiLCJhIjoiY2poeDd2M3l5MDg3YTNwbXQ5bnJxb2ZrYyJ9.MaYZFXW-7ChAgEOYp3C55Q"
    @placenames = Mapbox::Geocoder.geocode_reverse({
                                                       "latitude": @page.latitude.to_f,
                                                       "longitude": @page.longitude.to_f
                                                   })
  end

  def new
    @page = Page.new
  end
  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(pages_params)
    @page.save
    redirect_to page_path(@page)
  end
  def update
    @page = Page.find(params[:id])
    @page.update(params[:page])
  end

  private
    def pages_params
      params.require(:page).permit(%i[latitude longitude places])
    end
end
