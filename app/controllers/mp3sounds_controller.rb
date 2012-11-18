class Mp3soundsController < ApplicationController
	def show
		@mp3_sound = Mp3Sound.find(params[:id])
		send_data @mp3_sound.sound, :type => 'audio/mpeg'
	end
end
