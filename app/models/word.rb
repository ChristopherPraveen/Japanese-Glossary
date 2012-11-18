class Word < ActiveRecord::Base
	belongs_to :glossary
	has_one :mp3_sound

	def as_json (options)
		{ :id => id, 
			:english => english, 
			:romaji => romaji, 
			:japanese => japanese, 
			:glossary_id => glossary_id, 
			:glossary_name => glossary.glossary,
			:mp3sound_url => Rails.application.routes.url_helpers.mp3sound_url(:host => "japaneseglossary.herokuapp.com", :id => mp3_sound_id) }
	end
end
