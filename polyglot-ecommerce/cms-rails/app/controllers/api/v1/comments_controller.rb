module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_post
      before_action :set_comment, only: [:destroy]
      
      # GET /api/v1/posts/:post_id/comments
      def index
        @comments = @post.comments.approved.recent
        render json: @comments
      end
      
      # POST /api/v1/posts/:post_id/comments
      def create
        @comment = @post.comments.build(comment_params)
        
        if @comment.save
          render json: @comment, status: :created
        else
          render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
        end
      end
      
      # DELETE /api/v1/posts/:post_id/comments/:id
      def destroy
        @comment.destroy
        head :no_content
      end
      
      private
      
      def set_post
        @post = Post.find(params[:post_id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Post not found' }, status: :not_found
      end
      
      def set_comment
        @comment = @post.comments.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Comment not found' }, status: :not_found
      end
      
      def comment_params
        params.require(:comment).permit(:author_name, :author_email, :content)
      end
    end
  end
end