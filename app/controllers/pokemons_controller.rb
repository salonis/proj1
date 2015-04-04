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
			# @p.hidden = true
			# @p.health = 0
			@p.destroy
		else 
			@p.save
		end
		# redirect_to "/trainers/" + @p.trainer_id.to_s
		redirect_to trainer_path(@pokemon.trainer_id)
	end

	def destroy
		@p = Pokemon.find(params[:id])
		@p.destroy
		redirect_to trainer_path(@p.trainer_id)
	end
end
