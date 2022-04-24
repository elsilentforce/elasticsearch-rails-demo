module Api
  module V1
    class UsersController < ApplicationController

      def search
        @search_result = User.custom_search(search_params[:query])
        
        render json: @search_result, status: :ok
      end

      def search_params
        params.permit(:query, :page, :per_page)
      end

    end
  end
end
