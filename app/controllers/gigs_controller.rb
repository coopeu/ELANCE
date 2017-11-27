class GigsController < ApplicationController
	  before_action :set_gig, only: [:show, :edit, :update, :destroy]
	  before_action :authenticate_user!, except: [:index, :show, :advsearch]

    semantic_breadcrumb :index, :gigs_path

    #helper_method :sort_column, :sort_direction

	def index
#    @gigs = Gig.search[term].order('created_at DESC').page(params[:page]).per(10)

#    @gigs = if params[:term]
#OK      @gigs = Gig.search(params[:term]).order('created_at DESC').page(params[:page]).per(25)
      @gigs = Gig.search(params[:term]).order(params[:sort]).page(params[:page]).per(25)
#     @gigs = Gig.search(params[:term]).(sort_colum,sort_direction).page(params[:page]).per(25)
#    else
#		  @gigs = Gig.all.order('created_at DESC').page(params[:page]).per(25)
#	  end 
  end	

	def show
		@gigs = Gig.all 
		@gig = Gig.find(params[:id])
    semantic_breadcrumb @gig.name, gig_path(@gig)
    # semantic_breadcrumb :show, gig_path(@gig)
    @users = User.all
    #@gigs = Gig.all
    @user = User.find_by(:id=>:user_id)
	end		
	
	def new
		@gig = current_user.gigs.build
	end	

	  # GET /links/1/edit
  def edit
  end
	
	def create
		@gig = current_user.gigs.build(gig_params)    
		respond_to do |format|
      if @gig.save
        format.html { redirect_to @gig, notice: 'gig was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @gig.errors, status: :unprocessable_entity }
      end
    end
	end

  # PATCH/PUT /gigs/1
  def update
    respond_to do |format|
      if @gig.update(gig_params)
        format.html { redirect_to @gig, notice: 'Gig was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

 def destroy
    @gig.destroy
    respond_to do |format|
      format.html { redirect_to gigs_url, notice: 'Gig was successfully destroyed.' }
    end
  end

  def search
    @gigs = Gig.search[term].page(params[:page]).per(10)
  end

  def advsearch
    @gigs = Gig.all.page(params[:page]).per(10)
    if params[:category].present?
      @gigs = Gig.where(category_id: params[:category].to_i).page(params[:page]).per(10)
      @gigs = gigs.where('name LIKE ? or description LIKE ? or location LIKE ?',"%#{term}%",'%#{term}%', "%#{term}%").order('created_at DESC').page(params[:page]).per(10) if params[:tearm].present?
      @gigs = gigs.near(params[:location], 10).page(params[:page]).per(10) if params[:location].present?
    else
      @gigs = Gig.where('name LIKE ? or description LIKE ? or location LIKE ?',"%#{term}%",'%#{term}%', "%#{term}%").order('created_at DESC').page(params[:page]).per(10) if params[:tearm].present?     
    end
    @users = User.all
    @user = User.find_by(:id=>:user_id)
    @categories = Category.all
    @category = Category.find_by(:id=>:category_id)
  end
	

  private

#  def sort_column
#    params[:sort] || :name || 'name'
#  end
#  def sort_direction
#    params[:direction] || 'ASC'
#  end

	# Use callbacks to share common setup or constraints between actions.
  def set_gig
    @gig = Gig.find(params[:id])
  end

	def gig_params
		params.require(:gig).permit(:name, :description, :budget, :location, :category_id, :user_id, :search, :latitude, :longitude, :skill_list)
	end

  def current_user?(user)
   user == current_user
  end

end