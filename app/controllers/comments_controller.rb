class Gigs::CommentsController < ApplicationController
  # GET /gigs/:gig_id/comments
  def index
    #1st you retrieve the gig thanks to params[:gig_id]
    gig = Gig.find(params[:gig_id])
    #2nd you get all the comments of this gig
    @comments = gig.comments

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /gigs/:gig_id/comments/:id
  def show
    #1st you retrieve the gig thanks to params[:gig_id]
    gig = Gig.find(params[:gig_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = gig.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /gigs/:gig_id/comments/new
  def new
    #1st you retrieve the gig thanks to params[:gig_id]
    #gig = Gig.find(params[:gig_id])
    #2nd you build a new one
    #@comment = gig.comments.build
    @gig = Gig.find(params[:gig_id])
    @comment = Comment.new
  end

  # GET /gigs/:gig_id/comments/:id/edit
  def edit
    #1st you retrieve the gig thanks to params[:gig_id]
    gig = Gig.find(params[:gig_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = gig.comments.find(params[:id])
  end

  # POST /gigs/:gig_id/comments
  def create
    #1st you retrieve the gig thanks to params[:gig_id]
    @gig = Gig.find(params[:gig_id])
    #2nd you create the comment with arguments in params[:comment]
    #@comment = gig.comments.create(params[comment_params])
    @comment = Comment.new(comment_params)
    @comment.gig = @gig

    respond_to do |format|
      if @comment.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        #format.html { redirect_to([@comment.gig, @comment], :notice => 'Comment was successfully created.') }
        format.html { redirect_to([@gig], :notice => 'Comment was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /gigs/:gig_id/comments/:id
  def update
    #1st you retrieve the gig thanks to params[:gig_id]
    gig = Gig.find(params[:gig_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = gig.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@comment.gig, @comment], :notice => 'Comment was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /gigs/:gig_id/comments/1
  def destroy
    #1st you retrieve the gig thanks to params[:gig_id]
    gig = Gig.find(params[:gig_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = gig.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      #1st argument reference the path /gigs/:gig_id/comments/
      format.html { redirect_to(gig_comments_url) }
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end 


end