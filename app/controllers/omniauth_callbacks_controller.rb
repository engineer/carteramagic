class OmniauthCallbacksController < Devise::OmniauthCallbacksController

   def facebook
    omniauth = env['omniauth.auth']
    email = omniauth['info']['email']
    first_name = omniauth['info']['first_name']
    last_name = omniauth['info']['last_name']
    age_range = omniauth['info']['age_range']
    link = omniauth['info']['link']
    gender = omniauth['info']['gender']
    image = omniauth['info']['image']+"?type=normal"
    user = User.find_by_email(email)
    unless user
      random = Devise.friendly_token[0,20]
      user = User.new(:first_name => first_name, :last_name => last_name, :age => age_range, :link => link, :gender => gender, :image => image,:email => email, :password => random, :password_confirmation => random)
      user.save!
    end
    sign_in :user, user

    redirect_to dashboard_path
  end

#   def facebook
#     oauthorize :facebook
#   end
#
#   def twitter
#     oauthorize :twitter
#   end
#
#   def github
#     oauthorize :github
#   end
#
    def passthru
     render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
   end
#
#
# private
#
#   def oauthorize(kind)
#     identity = Identity.build_from_oauth(kind, env['omniauth.auth'])
#     @user = User.find_or_build_for_identity(identity, current_user)
#     new_user = @user.new_record?
#     if @user.save!
#       flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => kind
#       session["devise.#{kind}_data"] = env["omniauth.auth"]
#       sign_in :user, @user
#       redirect_to after_sign_in_path_for(@user)
#       SlackNotifier.user_registered(@user)
#     end
#   end

end
