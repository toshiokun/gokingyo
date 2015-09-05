class EventsController < ApplicationController
	PER = 10
	before_filter :authenticate_user!

	def index
		if params[:category_id].nil?
			@search = Event.page(params[:page]).per(PER).order(:created_at).search(search_params)
			@before_events = @search.result(distinct: true)
			@events = @before_events.where(address_status: current_user.address_status)
		else
			@search = Event.page(params[:page]).per(PER).where(category_id: params[:category_id]).order(:created_at).search(search_params)
			@before_events = @search.result(distinct: true)
			@events = @before_events.where(address_status: current_user.address_status)
		end
	end

	def edit
		@event = current_user.created_events.find(params[:id])
	end

	def update
		@event = current_user.created_events.find(params[:id])
		if @event.update(event_params)
			redirect_to @event, notice: '更新しました'
		else
			render :edit
		end
	end

	def destroy
		@event = current_user.created_events.find(params[:id])
		@event.destroy!
		redirect_to root_path, notice: '削除しました'
	end

	def new
		@event = current_user.created_events.build
	end

	def create
		@event = current_user.created_events.build(event_params)
		if @event.save
			redirect_to @event, notice: 'いどばたを作成しました'
		else
			render 'new'
		end
	end

	def show
		@event = Event.find(params[:id])
		@ticket = current_user && current_user.tickets.find_by(event_id: params[:id])
		@tickets = @event.tickets.includes(:user).order(:created_at)
		@microposts = @event.microposts.includes(:user).order(:created_at)
	end

	private
	def event_params
		params.require(:event).permit(
			:name, :content, :category_id, :address_status,
			:event_image, :event_image_cache, :remove_event_image
		)
		params.address_status = current_user.address_status
	end

	private
	def search_params
		params.require(:q).permit!
	rescue
		{ name_qteq: "" }
	end
end
