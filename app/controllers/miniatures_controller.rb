class MiniaturesController < ApplicationController
  
  def create
    @miniature = Miniature.new(params[:miniature])
    
    respond_to do |format|
        if @miniature.save
          format.html  { redirect_to(@miniature,
                        :notice => 'Post was successfully created.') }
          format.json  { render :json => @miniature,
                        :status => :created, :location => @miniature }
        else
          format.html  { render :action => "new" }
          format.json  { render :json => @miniature.errors,
                        :status => :unprocessable_entity }
        end
    end
  end
  
  def new
    @miniature = Miniature.new
    
    respond_to do |format|
        format.html  # new.html.erb
        format.json  { render :json => @post }
    end
  end
  
  def show
    breadcrumbs.add 'Miniatures', miniatures_path
    @miniatures = Miniature.all   
  end
  
end
