class MicropostsController < ApplicationController
	PER = 10
	before_filter :authenticate_user!

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
			render json: { messages: micropost.errors.full_messages }, status: 422
		end
	end

	def destroy
		@micropost = Micropost.find(params[:id])
		@micropost.destroy!
		redirect_to event_microposts_path(@micropost.event), notice: '削除しました'
	end
end
