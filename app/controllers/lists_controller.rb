class ListsController < ApplicationController
  def index
        @list = List.where(:user_id => current_user.id).order(:store)
        respond_to do |format|
        format.html # index.html.erb
        format.iphone # index.iphone.erb
        end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    respond_to do |format|
      if @list.save
        format.html { redirect_to(lists_path, :notice => 'Item added') }
        format.iphone { redirect_to(lists_path, :notice => 'Item added' ) }
      else
        format.html { render :action => "new" }
        format.iphone { redirect_to(lists_path, :notice => 'Item added' ) }
      end
    end
  end

  def show
    @list = List.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.iphone
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    respond_to do |format|
      format.html { redirect_to(lists_path,:notice => 'Item Deleted')}
      format.iphone { redirect_to(lists_path,  :notice => 'Item Deleted') }
    end
  end

   def done
  @list = List.find(params[:id])
  if @list.mdone?
  @list.update_attributes(:mdone => 0)
  else
   @list.update_attributes(:mdone => 1)
  end
     respond_to do |format|
        format.html { redirect_to(lists_path, :notice => 'Done') }
        format.iphone { redirect_to(lists_path, :notice => 'Done') }
     end
    end

  def update
     @list = List.find(params[:id])
    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to(lists_path, :notice => 'Item updated.') }
        format.iphone { redirect_to(lists_path, :notice => 'Item updated.') }
      else
      format.html { render :action => "edit" }
      format.iphone { render :action => "edit" }
      end
    end

  end
 def edit
    @list = List.find(params[:id])
  end
  
 
  def search
     @list = List.new
  end
end