class SignupsController < ApplicationController
  layout 'website'
  skip_before_action :authenticate
  force_ssl if: :ssl_configured?

  def new
    @site = Site.new
    @user = User.new
    @site.owner = @user
  end

  def create
    @site = Site.new(site_params)
    @user = current_user || User.new(site_params[:owner_attributes])
    @user.plan = Plan.find_by(code: 'free')
    @site.owner = @user
    @site.users << @user

    if @site.save
      login @user
      url = view_context.site_url(@site)

      flash[:analytics_signup] = true
      NotificationsMailer.analytics_email(:signup, @user, url).deliver_now

      if request.xhr?
        response.headers['turbolinks'] = 'false'
        render json: {}, status: :created, location: url
      else
        redirect_to url
      end
    else
      if request.xhr?
        render json: { site: @site.errors }, status: :unprocessable_entity
      else
        render 'signups/new'
      end
    end
  end

  private

  def site_params
    params.require(:site).permit(
      :name,
      :subdomain,
      owner_attributes: [
        :email,
        :password,
        :terms
      ]
    )
  end
end
