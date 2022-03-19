class ListingsController < ApplicationController

  # Sets up user access authentication except index and show page
  before_action :authenticate_user!, except: %i[index show]
  # refectors listing instance variable before show, edit, update and destroy
  before_action :set_listing, only: %i[show edit update destroy]
  #This before action secures listings modificated only by authorized user
  before_action :authorize_user, only: %i[edit update destroy]
  # This before action defines instance of objects in Models to help presenting in new and edit views
  before_action :set_form_vars, only: %i[new edit]

  # SELECT * FROM listings table ORDER BY "updated_at" "desc";
  def index
    @q = Listing.order(updated_at: :desc).ransack(params[:q])
    @listings = @q.result(distinct: true)
  end

  def show

  end
  
  # CREATE NEW MESSAGE
  def new
    @listing = Listing.new
  end

  # Since listings table belongs to users table, a user can have many listings, current_user is a record in the users table referenced in the listings table, so current_user can create a new listing with required values.
  # INSERT INTO listings table (column1, ...) VALUES (value1, ...)
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

  # UPDATE listings table SET column1 = value1, ... WHERE listingID = current listing_id;
  def update
    @listing.update(listing_params)
    if @listing.save 
      redirect_to @listing, notice: "Your listing successfully updated"
    else
      set_form_vars
      render "edit", notice: "Something went wrong"
    end 
  end

  # DELETE FROM listings TABLE WHERE "listings"."id" = current listing
  def destroy 
    @listing.destroy
    redirect_to listings_path, notice: "Your listing succesfully deleted"
  end

  private

  # SETS UP POST PARAMS PERMESSION ON NEW LISTING FORM
  def listing_params
    params.require(:listing).permit(:title, :price, :type_id, :size_id, :gender_id, :suburb, :state_id, :description, :picture, feature_ids: [])
  end

  # DEFINE USER AUTHORIZATION FOR ALLOWING ONLY LISTING OWNER CAN AND DELETE OWN LISTING
  def authorize_user
      if@listing.user_id != current_user.id
        flash[:alert] = "You don't have permission to do that"
        redirect_to listings_path
      end
  end

  # SETS LISTING INSTANCE BEFORE LOADING A LISTING PAGE
  def set_listing
    @listing = Listing.find(params[:id])
  end

  # SETS OBJECTS INSTANCE VARIABLES FOR HELPING FORM TO PRESENTING DATA
  def set_form_vars
    @types = Type.all
    @sizes = Size.all
    @genders = Gender.all
    @states = State.all
    @features = Feature.all
  end
end
