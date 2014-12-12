class YyInformationsController < ApplicationController
  # GET /yy_informations
  # GET /yy_informations.json
  skip_before_filter :authorize
  def index
    @yy_informations = YyInformation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yy_informations }
    end
  end

  # GET /yy_informations/1
  # GET /yy_informations/1.json
  def show
    @yy_information = YyInformation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yy_information }
    end
  end

  # GET /yy_informations/new
  # GET /yy_informations/new.json
  def new
    @yy_information = YyInformation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yy_information }
    end
  end

  # GET /yy_informations/1/edit
  def edit
    @yy_information = YyInformation.find(params[:id])
  end
  def status_change
    @yy_information = YyInformation.find(params[:id])
  end
  def add
    #@yy_information = YyInformation.find(params[:id])
    @u = User.find_by_id(session[:user_id])
    @article = Article.find(params[:id])
    @yy_information = YyInformation.new
    @yy_information.eqdwid = @article.name
    @yy_information.eqname = @article.title
    @yy_information.eqid=@article.id
    @yy_information.pname =@u.name
    @yy_information.dw =@u.unitname
    @yy_information.email =@u.email
    @yy_information.phoneno =@u.phone
    @yy_information.save
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yy_information }
    end
  end

  # POST /yy_informations
  # POST /yy_informations.json
  def create
    @yy_information = YyInformation.new(params[:yy_information])

    respond_to do |format|
      if @yy_information.save
        format.html { redirect_to @yy_information, notice: 'Yy information was successfully created.' }
        format.json { render json: @yy_information, status: :created, location: @yy_information }
     else
        format.html { render action: "new" }
        format.json { render json: @yy_information.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /yy_informations/1
  # PUT /yy_informations/1.json
  def update
    @yy_information = YyInformation.find(params[:id])

    respond_to do |format|
      if @yy_information.update_attributes(params[:yy_information])
        format.html { redirect_to @yy_information, notice: 'Yy information was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @yy_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yy_informations/1
  # DELETE /yy_informations/1.json
  def destroy
    @yy_information = YyInformation.find(params[:id])
    @yy_information.destroy

    respond_to do |format|
      format.html { redirect_to yy_informations_url }
      format.json { head :no_content }
    end
  end
end
