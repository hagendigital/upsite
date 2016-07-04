class LandingPagesController < ApplicationController
  skip_before_action :authenticate
  before_action :set_site
  layout 'website'

  private

  def set_site
    @site = Site.new
    @user = User.new
    @site.owner = @user
  end
end
