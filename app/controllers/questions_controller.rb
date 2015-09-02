class QuestionsController < ApplicationController
  	PER = 10

  	def index
		@questions = Question.page(params[:page]).per(PER)	
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
end
