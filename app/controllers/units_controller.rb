class UnitsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @units = Unit.all
    breadcrumbs.add 'Units', units_path
    
    #@units_path = Unit.all   
  end  
    
  def create
    # raise params.inspect
    @unit = Unit.new(params[:unit])
    @unit.stats = UnitStat.new(params[:stats])
    respond_to do |format|
        if @unit.save
          
          format.html  { redirect_to(@unit,
                        :notice => 'Unit was successfully created.') }
          format.json  { render :json       => @unit,
                                :status     => :created, 
                                :location   => @unit }
        else
          format.html  { render :action => :new }
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
  
  def edit
    @unit = Unit.find(params[:id])
  end
  
  def update
    unit = Unit.find(params[:id])
    unit.stats.destroy unless unit.stats.blank?
    unit.stats = UnitStat.new(params[:stats])
    
    respond_to do |format|
      if unit.update_attributes(params[:unit])
        @units = Unit.all    
        format.html  { render :controller => :units,
                              :action     => :show,
                              :notice     => 'Unit was successfully created' }

      else
        format.html  { render :action => :edit, :error => 'Unit could not be updated. Some fields may be wrong' }
      end
    end
    
    # raise params.inspect
  end
  
  def destroy
    #raise params.inspect
    Unit.find(params[:id]).destroy
    respond_to do |format|

      format.html  { redirect_to(:action => :show,
                       :notice => 'Unit was destroyed.') }

    end
  end
end
