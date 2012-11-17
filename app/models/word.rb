class Word < ActiveRecord::Base
	belongs_to :glossary

	def as_json (options)
		{ :id => id, :english => english, :romaji => romaji, :japanese => japanese, :glossary_id => glossary_id, :glossary_name => glossary.glossary }
	end
end
