class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def linkedin
    @user = User.find_for_oauth(env["omniauth.auth"], current_user)

    linkedin = env["omniauth.auth"]

    # Basic data retrive on oauth login
    @user.email = linkedin.info.email
    @user.create_profile_user
    @user.profile_user.first_name = linkedin.info.first_name
    @user.profile_user.last_name = linkedin.info.last_name
    @user.profile_user.industry_domain = linkedin.info.industry
    @user.profile_user.location= linkedin.info.location

    # Retrieve more data
    client = LinkedIn::Client.new('770bird5t2xs5e',ENV['LINKED_IN_SECRET'])
    client.authorize_from_access(linkedin.credentials.token, linkedin.credentials.secret)
    profile = client.profile(fields: %w(positions))
    begin
      @user.profile_user.company_name = profile.positions.all[0].company.name
    rescue
      @user.profile_user.company_name = 'INSA Lyon'
    end

    @user.profile_user.save
    @user.save

    sign_in_and_redirect @user, event: :authentication
    set_flash_message(:notice, :success, kind: "linked_in".capitalize) if is_navigational_format?

  end

  def after_sign_in_path_for(resource)
    if resource.email_verified?
      super resource
    else
      finish_signup_path(resource)
    end
  end
end