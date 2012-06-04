class ArmiesController < ApplicationController
  
  def show
    @armies = Army.all
    breadcrumbs.add 'Armies'
  end
  
  
  
end
