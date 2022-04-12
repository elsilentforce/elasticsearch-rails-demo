module Api
  module V1
    class UsersController < ApplicationController

      def search
        begin
          @search_result = User.search(search_params[:query]).objects
        rescue
          @search_result = JSON.new
        end
        
        render json: @search_result, status: :ok
      end

      def search_params
        params.permit(:query, :page, :per_page)
      end

    end
  end
end
