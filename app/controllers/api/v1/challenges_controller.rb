class Api::V1::ChallengesController < ApplicationController

	def index
		challenges = Challenge.all
		render json: challenges
	end

	def show
		challenge = Challenge.find(params[:id])
		render json: challenge
	end

	def create
		challenge = Challenge.new(challenge_params)
		if challenge.save
			render json: challenge
		else
			render json: {error: 'Error creating challenge'}
		end
	end

	def update
		challenge = Challenge.find(params[:id])
		if challenge
			challenge.update(challenge_params)
			render json: challenge
		else
			render json: {error: 'Error updating challenge'}
		end
	end

	def destroy
		challenge = Challenge.find(params[:id])
		if challenge
			challenge.destroy
			render json: {message: 'Challenge successfully deleted'}
		else
			render json: {error: 'Error deleting challenge'}
		end
	end

	private

	def challenge_params
		params.require(:challenge).permit(:title, :description, :start_date, :end_date)
	end
end
