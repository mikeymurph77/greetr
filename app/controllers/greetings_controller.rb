class GreetingsController < ApplicationController

	def index
		@greetings = Greeting.where(reciever_id: current_user.id).order(created_at: :desc)
	end

	def create
		greeting = current_user.greetings.create(greeting_params)
		greeting_html_string = render_to_string(greeting)
		Pusher.trigger(greeting.reciever_id, 'greeting-event', message: greeting_html_string)

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