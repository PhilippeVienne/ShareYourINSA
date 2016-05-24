class PostsController < ApplicationController
  before_action :ensure_json_request, except: [:show]
  before_action :set_post, only: [:show, :destroy]

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.json { render :show, status: :created, location: @post }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
  def ensure_json_request
    return if request.format == :json
    render :nothing => true, :status => 406
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by(id:params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.fetch(:post, {})
    end
end
