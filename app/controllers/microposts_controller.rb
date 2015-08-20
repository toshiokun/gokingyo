class MicropostsController < ApplicationController
	PER = 10

	def index
		@event = Event.find(params[:event_id])
		@microposts = @event.microposts.order(:created_at)
	end

	def create
		micropost = current_user.microposts.build do |m|
			m.event_id = params[:event_id]
			m.comment = params[:micropost][:comment]
		end
		if micropost.save
			redirect_to event_microposts_path(micropost.event), notice: '投稿が完了いたしました'
		else
			render json: { messages: ticket.errors.full_messages }, status: 422
		end
	end
end
