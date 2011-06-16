class ListqueriesController < ApplicationController

  def index
     @listquery = Listquery.where(:user_id => current_user.id)
        respond_to do |format|
      format.html # index.html.erb
        end
  end

  def edit
    @listquery = Listquery.where(:user_id => current_user.id).find(params[:id])
  end

   def show
       @listquery = Listquery.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
     @listquery = Listquery.new
  end

  def create
 @listquery = Listquery.new(params[:listquery])
    respond_to do |format|
      if @listquery.save
        format.html { redirect_to(listqueries_path, :notice => 'Search profile created' ) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
 @listquery = Listquery.find(params[:id])
    @listquery.destroy
    respond_to do |format|
      format.html { redirect_to(listqueries_url) }
    end
  end

  def update
    @listquery = Listquery.find(params[:id])
    respond_to do |format|
      if @listquery.update_attributes(params[:listquery])
        format.html { redirect_to(@listquery, :notice => 'Search profile updated.') }
      else
      format.html { render :action => "edit" }
      end
  end
  end



end
