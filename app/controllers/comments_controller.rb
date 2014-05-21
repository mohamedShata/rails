class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
   redirect_to ('/hotels/search/')
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
   # @comment = Comment.find(params[:id])

#    respond_to do |format|
 #     format.html # show.html.erb
  #    format.json { render json: @comment }
  #  end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    $hotel_id =params[:hotel_id]
    @comment = Comment.new
    @comments=Comment.where("hotel_id =? ", params[:hotel_id])
    logger.debug($hotel_id)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    dataComment={"user_id" => session[:userName].id, "hotel_id" => $hotel_id , "text" => params[:text]}
    @comment = Comment.new(dataComment)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to ('/hotels/search/')}
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  def createComment
     dataComment={"user_id" => session[:userName].id, "hotel_id" => $hotel_id , "text" => params[:text]}
    @comment = Comment.new(dataComment)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to ('/hotels/search/')}
      else
        format.html { render action: "new" }
      end
    end 
  end

end
