class ArmiesController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @armies = Army.all
    breadcrumbs.add 'Armies'
  end
    
  def new
    
    @army  = Army.new
    @units = Unit.all
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @post }
    end

  end
  
  def create
    
    @army           = Army.new(params[:army])
    @army.user_id   = current_user.id
    
    respond_to do |format|
      if @army.save
        @units  = Unit.all
        @points = @army.points
        format.html  { render :controller => :armies,
                              :action     => :army_builder,
                              :notice     => 'Army was successfully created. Choose your troops' }
        format.json  { render :json     => @army,
                              :status   => :created, 
                              :location => @army }
      else
        format.html  { render :action => :new }
        format.json  { render :json   => @army.errors,
                              :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    
    @army = Army.find(params[:army_id])
    
    respond_to do |format|
        @units  = Unit.all
        @points = @army.points - @army.units.sum(&:points)
        format.html  { render :controller => :armies,
                              :action     => :army_builder }
    end
  end
    
  def army_builder
  end

  
  def update_army_list
    
    @army = Army.find(params[:army_id])
    unit  = Unit.find(params[:id])
    if params[:move].eql?("add")
      @army.units << unit
    elsif params[:move].eql?("remove")
      @army.units.delete(unit)
    end
    @points = @army.points - @army.units.sum(&:points)
    
    respond_to do |format|
      format.js
    end
  end
  
end
