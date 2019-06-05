class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #d6ebafe3f185ba281860005067fa742a
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_one:profile
  has_many:posts
  has_many:comments
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        name:  auth.info.name,
        password: Devise.friendly_token[0, 20],
        facebook_image:  auth.info.image
      )
    end

    user
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def image_show
    if self.profile.persisted? && self.profile.image?
      self.profile.image.to_s
    elsif !self.facebook_image.nil?
      self.facebook_image.to_s
    else
      "/assets/no_avatar.png"
    end
  end

  def following?(other_user)
   following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
   following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
   following_relationships.find_by(following_id: other_user.id).destroy
  end
end
