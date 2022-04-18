class Admin::GistsController < ApplicationController

  def index
    @gists = Gist.all
  end

  def clear_gists
    service = GistSaveService.new
    result = Gist.all.each { |gist|
      service.delete_gist(gist.link.delete_prefix('https://gist.github.com/'))
      gist.destroy
    }
    render :index, { notice: result }
  end
end
