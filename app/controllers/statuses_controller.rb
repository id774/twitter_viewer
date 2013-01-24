# -*- coding: utf-8 -*-

class StatusesController < ApplicationController
  before_filter :authenticate if Auth.basic_auth
  #before_filter :authenticate_user!

  # GET /statuses
  # GET /statuses.json
  def index
    @search = Status.search(params[:search], :order => "id DESC")
    @statuses = @search.paginate(:page => params[:page], :order => "id DESC")

    @statuses = @statuses.where(:uid => params[:uid]) unless params[:uid].nil?
    @statuses = @statuses.where(:screen_name => params[:screen_name]) unless params[:screen_name].nil?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statuses }
    end
  end

  # GET /statuses/1/edit
  def edit
    @status = Status.find(params[:id])
  end

  private
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == Auth.username &&
      password == Auth.password
    end
  end
end
