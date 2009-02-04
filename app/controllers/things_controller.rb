class ThingsController < ApplicationController
  
  def index
    session[:current_page] = :index
    
    @things = get_things
    
    if request.xhr?
      render(:partial => "things", :object => @things)
    end
  end
  
  def today
    session[:current_page] = :today

    @things = get_things
    
    if request.xhr?
      render(:partial => "things", :object => @things)
    else
      render(:action => "index")
    end
  end
  
  def lastweek
    session[:current_page] = :lastweek
    
    @things = get_things
    
    if request.xhr?
      render(:partial => "things", :object => @things)
    else
      render(:action => "index")
    end
  end
  
  def add
    thing = Thing.new
    thing.text = params[:text]
    
    if thing.save
      @new_thing = thing
      @things = get_things
      redirect_to(:action => :index) unless request.xhr?
    else
      flash[:notice] = "Must enter a thing"
      redirect_to :action => :index
    end
  end
  
  def delete
    thing = Thing.find(params[:id])
    thing.destroy
    
    @things = get_things
    #redirect_to :action => :index unless request.xhr?
    render(:partial => "things", :object => @things)
  end
  
  private
  
  def get_things
    current_page = session[:current_page] || :index
    
    if current_page == :index
      Thing.get_things
    elsif current_page == :today
      Thing.get_things_after(Date.today)
    elsif current_page == :lastweek
      Thing.get_things_after(1.week.ago)
    else
      Thing.get_things
    end
  end
end
