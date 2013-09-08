class User < ActiveRecord::Base
  devise :omniauthable, :omniauth_providers => [:twitter]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :galleries

  def email_required?
    super && provider.blank?
  end

  def password_required?
    super && provider.blank?
  end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.twitter_data"] && session["devise.twitter_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end

  def self.find_for_twitter_oauth(omniauth)
    authentication = User.where(provider: omniauth.provider, uid: omniauth.uid).first
    if authentication && authentication.user
      authentication.user
    else
      user = User.create!(:uid => omniauth['info']['nickname'],
                            :name => omniauth['info']['name'])
      user.authentications.create!(:provider => omniauth['provider'], :uuid => omniauth['uid'])
      user.save
      user
    end
  end
end