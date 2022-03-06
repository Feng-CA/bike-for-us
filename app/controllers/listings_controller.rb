class ListingsController < ApplicationController

  # Sets up user access authentication except index and show page
  before_action :authenticate_user!, except: [:index, :show]
  # refectors listing instance before show, edit, update and destory
  before_action :set_listing, only: [:show, :edit, :update, :destory]
  #This before action secures listings modificated only by authorized user
  before_action :authorize_user, only: [:edit, :update, :destroy]
  # This before action helps new and edit views
  before_action :set_form_vars, only: [:new, :edit]

  def index
    @listings = Listing.order("states.name").includes(:state)
  end

  def show
   
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save 
      redirect_to @listing, notice: "Your listing successfully created"
    else
      set_form_vars
      render "new", notice: "Something went wrong!"
    end 
  end

  def edit
  
  end

  def update
    @listing.update(listing_params)
    if @listing.save 
      redirect_to @listing, notice: "Your listing successfully updated"
    else
      set_form_vars
      render "edit", notice: "Something went wrong"
    end 
  end

  def destory
    @listing.destroy
    redirect_to listings_path, notice: "Your listing succesfully deleted"
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :price, :type_id, :size_id, :gender_id, :suburb, :state_id, :description, :picture, feature_ids: [])
  end

  def authorize_user 
    if @listing.user_id != current_user.id
      flash[:alert] = "You don't have permission to do that"
      redirect_to listings_path
    end 
  end 

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def set_form_vars
    @types = Type.all
    @sizes = Size.all
    @genders = Gender.all
    @states = State.all
    @features = Feature.all
  end 
  
end
