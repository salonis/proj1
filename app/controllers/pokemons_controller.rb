class PokemonsController < ApplicationController
	def capture
		@p = Pokemon.find(params[:id])
		@p.trainer = current_trainer
		@p.save!
		redirect_to "/"
	end

	def damage
		@p = Pokemon.find(params[:id])
		# trainer_id = p.trainer_id
		@p.health = @p.health - 10
		if @p.health <= 0

			@p.destroy
		else 
			@p.save
		end
		# redirect_to "/trainers/" + @p.trainer_id.to_s
		redirect_to trainer_path(@p.trainer_id)
	end

	def destroy
		@p = Pokemon.find(params[:id])
		@p.destroy
		redirect_to trainer_path(@p.trainer_id)
	end

	def create_new
		@p2 = Pokemon.new(pokemon_params)
		@p2.health = 100
		@p2.level = 1
		@p2.trainer = current_trainer
		if @p2.save
			redirect_to trainer_path(@p2.trainer_id)
		else 
			flash.now[:error] = @p2.errors.full_messages.to_sentence
			redirect_to trainer_path(@p2.trainer_id)
		end
	end

	def new 
		@p2 = Pokemon.new
	end

	def pokemon_params
		params.require(:p2).permit(:name)
	end


end
