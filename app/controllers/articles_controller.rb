# encoding: utf-8
class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.xml
  skip_before_filter :authorize
  def status_maintain
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
      end
  end
  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end
  def status_change
    @article = Article.find(params[:id])
  end
  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end
  def search
    searchName=params[:article][:title]
    case params[:search_type]
      when 'name'
        sql="select * from articles where title like '%"+searchName+"%'"
      when 'dw'
        sql="select * from articles where name like '%"+searchName+"%'"
      when 'eqspec'
        sql="select * from articles where eqspec like '%"+searchName+"%'"
      when 'status'
        sql="select * from articles where status like '%"+searchName+"%'"
      when 'type'
        sql="select * from articles where title like '%"+searchName+"%'"
    end
    @articles=Article.find_by_sql(sql)
    if @articles==nil
     #flash[:notice]="未找到相关设备"
    end
  end
  def search_status
    searchName=params[:article][:title]
    case params[:search_type]
      when 'name'
        sql="select * from articles where title like '%"+searchName+"%'"
      when 'dw'
        sql="select * from articles where name like '%"+searchName+"%'"
      when 'eqspec'
        sql="select * from articles where eqspec like '%"+searchName+"%'"
      when 'status'
        sql="select * from articles where status like '%"+searchName+"%'"
      when 'type'
        sql="select * from articles where title like '%"+searchName+"%'"
    end
    @articles=Article.find_by_sql(sql)
  end
  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end
end
