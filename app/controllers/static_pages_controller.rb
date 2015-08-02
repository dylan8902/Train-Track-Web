class StaticPagesController < ApplicationController


  # GET /
  # GET /.json
  # GET /.xml
  def index
    if user_signed_in?
      @user = current_user

      respond_to do |format|
        format.html { render :home }
        format.xml { render xml: @user }
        format.json { render json: @user, callback: params['callback'] }
      end
    end
  end


  # GET /help
  # GET /help.json
  # GET /help.xml
  def help
    @help = "Coming soon!"
    @help = ReferenceDataHelper.update_schedule

    respond_to do |format|
      format.html
      format.xml { render xml: @help }
      format.json { render json: @help, callback: params['callback'] }
    end
  end


  # GET /terms
  # GET /terms.json
  # GET /terms.xml
  def terms
    @terms = "Coming soon!"

    respond_to do |format|
      format.html
      format.xml { render xml: @terms }
      format.json { render json: @terms, callback: params['callback'] }
    end
  end


  # GET /privacy
  # GET /privacy.json
  # GET /privacy.xml
  def privacy
    @privacy = "Coming soon!"

    respond_to do |format|
      format.html
      format.xml { render xml: @privacy }
      format.json { render json: @privacy, callback: params['callback'] }
    end
  end


  # GET /data-feeds
  # GET /data-feeds.json
  # GET /data-feeds.xml
  def data_feeds
    @data_feeds = "Coming soon!"

    respond_to do |format|
      format.html
      format.xml { render xml: @data_feeds }
      format.json { render json: @data_feeds, callback: params['callback'] }
    end
  end


  # GET /download
  # GET /download.json
  # GET /download.xml
  def download
    @download = "Coming soon!"

    respond_to do |format|
      format.html
      format.xml { render xml: @download }
      format.json { render json: @download, callback: params['callback'] }
    end
  end


  # GET /style-guide
  # GET /style-guide.json
  # GET /style-guide.xml
  def style_guide
    @guide = [
      { title: "Title", content: "Train Track" },
      { title: "Slogan", content: "The app that lets you track your train journeys" },
      { title: "Social Username", content: "traintrackapp" }
    ]

    respond_to do |format|
      format.html
      format.xml { render xml: @guide }
      format.json { render json: @guide, callback: params['callback'] }
    end
  end

end
