class MyValidator < ActiveModel::Validator
  def validate(record)
    unless !record.name.nil?
      record.errors[:name] << "cannot be blank"
    end
  end
end

class User < ApplicationRecord
  include ActiveModel::Validations
  validates_with MyValidator

  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :workshops, through: :skills
  enum role: [:member, :admin]

  validates :name, format: { without: /[0-9]/, message: "does not allow numbers" }
  validates :email, uniqueness: true

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
        user = User.create(name: data["name"],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
    end
  end

  def self.find_for_slack(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name: data["name"],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
    end
  end

  def self.search_by(field, value)
    where(field => value)
  end

  def self.search_terms
    ['id','name','email']
  end

  def allowed_workshops
    workshops.collect { |workshop| workshop.skills.all? { |skill| self.skills.include?(skill) } ? workshop : nil}.compact.uniq.sort_by(&:name)
  end

  def skill_level(skill)
      user_skill = UserSkill.find_by(user_id: self.id, skill_id: skill.id)
      if !user_skill
        "unskilled"
      else
        user_skill.skill_level
      end
  end

  def has_workshop(workshop)
    if allowed_workshops.include?(workshop) || workshop.skills.empty?
      "skilled"
    else
      "unskilled"
    end
  end

  def teach_skill(student, current_user, skill)
    teacher_skill = UserSkill.find_by(user_id: current_user.id, skill_id: skill.id)
    unless !teacher_skill.expert?
      student.skills << skill
    end
  end
end
