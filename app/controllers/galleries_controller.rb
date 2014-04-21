include GalleriesHelper

class GalleriesController < ApplicationController
  def more
    respond_to do |format|
      format.html { render "galleries/galleries", layout: false }
      format.js { render 'galleries/galleries', layout: false }
    end
  end
end
