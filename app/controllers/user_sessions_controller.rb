class UserSessionsController < ApplicationController
  
  def index
    user = UserSession.find
    render :text => 'Session User : ' + current_user.username + ' ' + current_user.id.to_s
  end
  
  # GET /user_sessions/new
  # GET /user_sessions/new.json
  def new
    redirect_to glossaries_url unless current_user.nil?
    @user_session = UserSession.new
  end

  
  # POST /user_sessions
  # POST /user_sessions.json
  def create
    @user_session = UserSession.new(params[:user_session])

    if @user_session.save
      redirect_to glossaries_url
    else
      render action: "new"
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.json
  def destroy
    @user_session = UserSession.find
    @user_session.destroy

    redirect_to login_url
  end
end
