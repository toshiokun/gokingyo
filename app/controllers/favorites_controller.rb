class FavoritesController < ApplicationController
	before_filter :authenticate_user!

	def now
		raise ActionController::RoutingError 'ログイン状態で TicketsController#new にアクセス'
	end

	def create
		favorite = current_user.favorites.build do |t|
			t.micropost_id = params[:micropost_id]
		end
		if favorite.save
			redirect_to event_microposts_path(favorite.micropost.event)
		else
			render json: { messages: ticket.errors.full_messages }, status: 422
		end
	end

	def destroy
		favorite = current_user.favorites.find_by(micropost_id: params[:micropost_id])
		favorite.destroy!
		redirect_to event_microposts_path(favorite.micropost.event)
	end	
end
