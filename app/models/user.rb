class User < ApplicationRecord
  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :workshops, through: :skills

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.new(name: data["name"],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
    end
  end

  def allowed_workshops
    workshops.collect { |workshop| workshop.skills.all? { |skill| self.skills.include?(skill) } ? workshop : nil}.compact.uniq
  end

  def has_skill(skill)
    if skills.include?(skill)
      "skilled"
    else
      "unskilled"
    end
  end

end
