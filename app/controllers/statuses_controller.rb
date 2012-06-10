# -*- coding: utf-8 -*-

class StatusesController < ApplicationController
  #before_filter :authenticate_user!

  # GET /statuses
  # GET /statuses.json
  def index
    @search = Status.search(params[:search])
    # @statuses = Status.scoped(:order => "id DESC").page(params[:page]).per(1000)
    @statuses = @search.paginate(:page => params[:page], :order => "id DESC")
    # @statuses = @search.scoped(:order => "id DESC").page(params[:page]).per(1000)

    unless params[:uid].nil?
      @statuses = @statuses.where(:uid => params[:uid])
    end
    unless params[:screen_name].nil?
      @statuses = @statuses.where(:screen_name => params[:screen_name])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statuses }
    end
  end

  # GET /statuses/1/edit
  def edit
    @status = Status.find(params[:id])
  end

  # PUT /statuses/1
  # PUT /statuses/1.json
  def update
    @status = Status.find(params[:id])

    respond_to do |format|
      if @status.update_attributes(params[:status])
        format.html { redirect_to edit_status_path(@status), notice: 'status was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end
end
