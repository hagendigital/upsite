class SignupsController < ApplicationController
  layout :resolve_layout
  skip_before_action :authenticate, only: [:new, :create]
  force_ssl if: :ssl_configured?

  def new
    if current_user
      redirect_to(view_context.site_url(current_user.site)) and return
    end
    @user = User.new
    @site = Site.new(owner: @user)
    version = %w(a b).include?(params[:v]) ? params[:v] : 'b'
    render "new_#{version}"
  end

  def create
    @site = Site.new(site_params)
    @user = User.new(site_params[:owner_attributes])
    @site.owner = @user
    @site.users << @user

    if @site.save
      login @user
      flash[:analytics_signup] = true
      NotificationsMailer.welcome_email(@user, view_context.site_url(@site)).deliver_now
      response.headers['turbolinks'] = 'false'
      render json: {}, status: :created, location: view_context.site_url(@site)
    else
      render json: { site: @site.errors }, status: :unprocessable_entity
    end
  end

  def cancel
    @user = current_user
    @site = current_site
  end

  def destroy
    NotificationsMailer.analytics_email(:cancel, current_user, params[:reason]).deliver_now
    cookies.delete(:remember_token, domain: :all)
    current_user.destroy
    redirect_to login_url(subdomain: 'www')
  end

  private

  def site_params
    params.require(:site).permit(
      :name,
      :subdomain,
      :markdown,
      owner_attributes: [
        :email,
        :password,
        :terms
      ]
    )
  end

  def resolve_layout
    case action_name
    when 'cancel'
      'application'
    else
      'website'
    end
  end
end
