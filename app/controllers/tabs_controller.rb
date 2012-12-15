class TabsController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :index, :profile]
  # GET /tabs
  # GET /tabs.json
  def index
    @search = Tab.search do
      fulltext params[:search]
      if params[:username].present?
        @uname = User.where(:username => params[:username]).first
        if !@uname.nil?
          with(:user_id).equal_to(@uname.id)
        end
      elsif params[:artist].present?
        with(:artist).equal_to(params[:artist])
      end
      order_by :artist
      order_by :song
    end
    @tabs = @search.results

    respond_to do |format|
      format.html
      format.json { render json: @tabs }
    end
  end

  def mine
    if user_signed_in?
      @search = Tab.search do
        fulltext params[:search]
        with(:user_id).equal_to(current_user.id)
      end
    end
    @tabs = @search.results

    respond_to do |format|
      format.html
      format.json { render json: @tabs }
    end
  end

  def profile
    if params[:username].present?
      @user = User.where(:username => params[:username]).first
      if @user.nil?
        flash[:error] = "User doesn't exist!"
      end
    end
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  # GET /tabs/1
  # GET /tabs/1.json
  def show
    @tab = Tab.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tab }
    end
  end

  # GET /tabs/new
  # GET /tabs/new.json
  def new
    @tab = Tab.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tab }
    end
  end

  # GET /tabs/1/edit
  def edit
    @tab = Tab.find(params[:id])
  end

  # POST /tabs
  # POST /tabs.json
  def create
    @tab = Tab.new(params[:tab])
    @tab.user = current_user

    respond_to do |format|
      if @tab.save
        format.html { redirect_to @tab, notice: 'Tab was successfully created.' }
        format.json { render json: @tab, status: :created, location: @tab }
      else
        format.html { render action: "new" }
        format.json { render json: @tab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tabs/1
  # PUT /tabs/1.json
  def update
    @tab = Tab.find(params[:id])

    respond_to do |format|
      if @tab.update_attributes(params[:tab])
        format.html { redirect_to @tab, notice: 'Tab was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tabs/1
  # DELETE /tabs/1.json
  def destroy
    @tab = Tab.find(params[:id])
    @tab.destroy

    respond_to do |format|
      format.html { redirect_to "/mine", notice: 'Tab was deleted.'}
      format.json { head :no_content }
    end
  end
end
