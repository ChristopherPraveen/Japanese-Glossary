class WordsController < ApplicationController
	def index
		respond_to do |format|
			format.js
		end
	end

	def edit
		@word = Word.find(params[:id])
	end

	def update
		@word = Word.find(params[:id])
		@file = params[:upload]
		unless @file.blank?
			@sound = Mp3Sound.new
			@sound.sound = @file.read
			@sound.save
			@word.mp3_sound_id = @sound.id
			@word.save
		end
		redirect_to edit_word_url(@word)
	end

	def sound
		@sound = Mp3Sound.find(6)
		send_data @sound.sound, :type => 'audio/mpeg'
	end

	def removesound
		@word = Word.find(params[:id])
		unless @word.mp3_sound_id.nil?
			@file = Mp3Sound.find(@word.mp3_sound_id)
			@file.destroy
			@word.mp3_sound_id = nil
			@word.save
		end
		redirect_to edit_word_url(@word)
	end
end
