class GlossariesController < ApplicationController

	def index
		redirect_to login_url if current_user.nil?
		@glossaries = Glossary.all
	end

	def show
		@glossary = Glossary.find(params[:id])
		@words = @glossary.words
		respond_to do |format|
			format.js
		end
	end

	def search
		@query = params[:query] || ''
		response.headers['Content-type'] = 'application/json; charset=utf-8'
		@words = Word.where("english like '%#{@query}%' or romaji like '%#{@query}%' or japanese like '%#{@query}%'")
		respond_to do |format|
			format.html { render :layout => false }
			format.json { render :json => { :words => @words } }
		end
	end
end
