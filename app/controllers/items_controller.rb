class ItemsController < ApplicationController


  def index
    page = params[:page] ? params[:page] : 1
    page_size = params[:page_size] ? params[:page_size].to_i : 10
    items = Item.select("items.*, COUNT(reviews.id) review_count").joins(:reviews).group("items.id").order("review_count DESC")
    items = items.page(page).per_page(page_size)
    result = items.map do |item|
      { :id => item.id, :title => item.title, :image_url => item.image_url, :counters => {:reviews => item.reviews.count}}
    end
    respond_to do |format|
      format.json { render json: result }
    end
  end

  def show
    reviews = Review.includes(:item).where(item_id: params[:id]).order("created_at desc").limit(10)
    item = reviews.first.item
    result = { :id => item.id, :title => item.title, :image_url => item.image_url,:createdAt => item.created_at, :reviews => reviews.all}
    respond_to do |format|
      format.json { render json: result }
    end
  end

end
