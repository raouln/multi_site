class UnitsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    raise params.inspect
    @unit = Unit.new(params[:unit])
    
    respond_to do |format|
        if @unit.save
          format.html  { redirect_to(@unit,
                        :notice => 'Post was successfully created.') }
          format.json  { render :json       => @unit,
                                :status     => :created, 
                                :location   => @unit }
        else
          format.html  { render :action => "new" }
          format.json  { render :json => @unit.errors,
                        :status => :unprocessable_entity }
        end
    end
  end
  
  def new
    @unit = Unit.new
    
    respond_to do |format|
        format.html  # new.html.erb
        format.json  { render :json => @post }
    end
  end
  
  def show
    breadcrumbs.add 'Units', units_path
    @units_path = Unit.all   
  end
  
end
