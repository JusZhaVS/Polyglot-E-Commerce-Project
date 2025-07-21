module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]
      
      # GET /api/v1/posts
      def index
        @posts = Post.includes(:author, :categories).published.recent
        
        if params[:category]
          @posts = @posts.joins(:categories).where(categories: { slug: params[:category] })
        end
        
        render json: @posts, include: [:author, :categories]
      end
      
      # GET /api/v1/posts/:id
      def show
        render json: @post, include: [:author, :categories, :comments]
      end
      
      # POST /api/v1/posts
      def create
        @post = Post.new(post_params)
        
        if @post.save
          render json: @post, status: :created
        else
          render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
      end
      
      # PUT /api/v1/posts/:id
      def update
        if @post.update(post_params)
          render json: @post
        else
          render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
      end
      
      # DELETE /api/v1/posts/:id
      def destroy
        @post.destroy
        head :no_content
      end
      
      private
      
      def set_post
        @post = Post.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Post not found' }, status: :not_found
      end
      
      def post_params
        params.require(:post).permit(:title, :content, :excerpt, :author_id, :published, category_ids: [])
      end
    end
  end
end