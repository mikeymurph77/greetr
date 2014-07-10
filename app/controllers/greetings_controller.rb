class GreetingsController < ApplicationController

	def index
		@greetings = Greeting.where(reciever_id: current_user.id).order(created_at: :desc)
	end

	def create
		greeting = current_user.greetings.create(greeting_params)

		redirect_to :greetings
		
	end

	private

	def greeting_params
		params.require(:greeting).permit(
			:body,
			:reciever_id,
			)
	end

end