class ArmiesController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @armies = Army.all
    breadcrumbs.add 'Armies'
  end
    
  def new
    
    @army       = Army.new
    @miniatures = Unit.all
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @post }
    end

  end
  
  def create
    #raise params.inspect
    @army           = Army.new(params[:army])
    @army.user_id   = current_user.id
    
    respond_to do |format|
      if @army.save
        @units   = Unit.all
        
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
  
  def army_builder
    @units = Unit.all
  end
  
  def selectable_units
    flash[:notice] = params
    render :update do |page|
      page.render_html "miniatures", :partial => miniatures
    end
  end
  
  def update_army_list
    raise params.inspect
    respond_to do |format|
      format.js 
    end
  end
  
  def edit
    @army = Army.find(params[:id])
  end
  
end
