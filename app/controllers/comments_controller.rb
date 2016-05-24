class CommentsController < ApplicationController
  before_action :ensure_json_request
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :set_post, only: [:index, :create]

  # GET /post/:post_id/comments
  def index
    @comments = @post.comments
  end

  # GET /post/:post_id/comments/1
  def show
  end

  # POST /post/:post_id/comments
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post

    respond_to do |format|
      if @comment.save
        format.json { render :show, status: :created}
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post/:post_id/comments/:id
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.json { render :show, status: :ok, location: @comment }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post/:post_id/comments/:id
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    def ensure_json_request
      return if request.format == :json
      render :nothing => true, :status => 406
    end

    def set_post
      @post = Post.find_by id: params[:post_id]
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      set_post
      @comment = @post.comments.find_by id: params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
