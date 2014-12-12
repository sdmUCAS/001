# encoding: utf-8
class TimeAllocatesController < ApplicationController
  # GET /time_allocates
  # GET /time_allocates.json
  def index
    @time_allocates = TimeAllocate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @time_allocates }
    end
  end

  # GET /time_allocates/1
  # GET /time_allocates/1.json
  def show
    @time_allocate = TimeAllocate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @time_allocate }
    end
  end
  def personal_account
    @user = User.find(params[:id])
    searchName = @user.name
    sql="select * from time_allocates where user_name like '%"+searchName+"%'"
    @time_allocates=TimeAllocate.find_by_sql(sql)
    if @time_allocates==nil
      flash[:notice]="未找到相关设备"
    end
  end
  def add
    @yy_information = YyInformation.find(params[:id])
    @time_allocate = TimeAllocate.new
    @time_allocate.eqid=@yy_information.eqid
    @time_allocate.eqname=@yy_information.eqname
    @time_allocate.yyid=@yy_information.yyid
    @time_allocate.user_name=@yy_information.pname
    @time_allocate.eq_unitname=@yy_information.eqdwid
    @time_allocate.user_unitname=@yy_information.dw
    @time_allocate.save
  end
  def lookup
    @yy_information = YyInformation.find(params[:id])
    searchName=@yy_information.yyid
    sql="select * from time_allocates where yyid = "+searchName.to_s+""
    @time_allocates=TimeAllocate.find_by_sql(sql)
    if @time_allocates==nil
      flash[:notice]="未找到相关设备"
    end
  end
  # GET /time_allocates/new
  # GET /time_allocates/new.json
  def new
    @time_allocate = TimeAllocate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @time_allocate }
    end
  end

  # GET /time_allocates/1/edit
  def edit
    @time_allocate = TimeAllocate.find(params[:id])
  end

  # POST /time_allocates
  # POST /time_allocates.json
  def create
    @time_allocate = TimeAllocate.new(params[:time_allocate])

    respond_to do |format|
      if @time_allocate.save
        format.html { redirect_to @time_allocate, notice: 'Time allocate was successfully created.' }
        format.json { render json: @time_allocate, status: :created, location: @time_allocate }
      else
        format.html { render action: "new" }
        format.json { render json: @time_allocate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /time_allocates/1
  # PUT /time_allocates/1.json
  def update
    @time_allocate = TimeAllocate.find(params[:id])

    respond_to do |format|
      if @time_allocate.update_attributes(params[:time_allocate])
        format.html { redirect_to @time_allocate, notice: 'Time allocate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @time_allocate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_allocates/1
  # DELETE /time_allocates/1.json
  def destroy
    @time_allocate = TimeAllocate.find(params[:id])
    @time_allocate.destroy

    respond_to do |format|
      format.html { redirect_to time_allocates_url }
      format.json { head :no_content }
    end
  end
  def pay
    @time_allocate = TimeAllocate.find(params[:id])
  end
end
