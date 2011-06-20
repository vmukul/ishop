class PagesController < ApplicationController

  def new
    respond_to do |format|
        format.html # new.html.erb
        format.iphone # new.iphone.erb
        end
  end

end
