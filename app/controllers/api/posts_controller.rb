class Api::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_post, only: [:show, :update, :destroy]

  # GET /api/products
  # GET /api/products.json
  def index
    render json: current_user.posts.all
    # TODO order posts alphabetically
  end

  # GET /api/products/1
  # GET /api/products/1.json
  def show
    render json: @api_post
  end

  # POST /api/products
  # POST /api/products.json
  def create
    @api_post = current_user.posts.new(api_post_params)
    if @api_post.save
      render :show
    else
      render json: @api_post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/products/1
  # PATCH/PUT /api/products/1.json
  def update
    if @api_post.update(api_post_params)
      render :show
    else
      render json: @api_post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/products/1
  # DELETE /api/products/1.json
  def destroy
    @api_post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_post
      @api_post = current_user.posts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_post_params
      params.require(:post).permit(:title, :body, :image )
    end
end
