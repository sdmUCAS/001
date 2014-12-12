class EqMaintainsController < ApplicationController
  # GET /eq_maintains
  # GET /eq_maintains.json
  def index
    @eq_maintains = EqMaintain.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eq_maintains }
    end
  end
  def add
    @eq_maintain = EqMaintain.new
    @article = Article.find(params[:id])
    @eq_maintain.eqid=@article.id
    @eq_maintain.eqname=@article.title
    @eq_maintain.save
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @eq_maintain }
    end
    end
  # GET /eq_maintains/1
  # GET /eq_maintains/1.json
  def show
    @eq_maintain = EqMaintain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @eq_maintain }
    end
  end

  # GET /eq_maintains/new
  # GET /eq_maintains/new.json
  def new
    @eq_maintain = EqMaintain.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @eq_maintain }
    end
  end

  # GET /eq_maintains/1/edit
  def edit
    @eq_maintain = EqMaintain.find(params[:id])
  end

  # POST /eq_maintains
  # POST /eq_maintains.json
  def create
    @eq_maintain = EqMaintain.new(params[:eq_maintain])

    respond_to do |format|
      if @eq_maintain.save
        format.html { redirect_to @eq_maintain, notice: 'Eq maintain was successfully created.' }
        format.json { render json: @eq_maintain, status: :created, location: @eq_maintain }
      else
        format.html { render action: "new" }
        format.json { render json: @eq_maintain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /eq_maintains/1
  # PUT /eq_maintains/1.json
  def update
    @eq_maintain = EqMaintain.find(params[:id])

    respond_to do |format|
      if @eq_maintain.update_attributes(params[:eq_maintain])
        format.html { redirect_to @eq_maintain, notice: 'Eq maintain was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @eq_maintain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eq_maintains/1
  # DELETE /eq_maintains/1.json
  def destroy
    @eq_maintain = EqMaintain.find(params[:id])
    @eq_maintain.destroy

    respond_to do |format|
      format.html { redirect_to eq_maintains_url }
      format.json { head :no_content }
    end
  end
end
