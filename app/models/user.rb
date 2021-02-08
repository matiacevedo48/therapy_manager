class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :ratings, dependent: :destroy
  has_many :user_specialties, dependent: :destroy
  has_many :specialties, through: :user_specialties
  has_many :attentions, dependent: :destroy
  has_many :schedule_events, dependent: :destroy
  after_create :welcome_user
  
  validates :username, :email, :password, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(username: data['name'],
                         email: data['email'],
                         password: Devise.friendly_token[0, 20]
      )
    end
    user
  end

  def welcome_user
    mailer = MailgunMailer.welcome_email(self)
    mailer_response = mailer.deliver_now
    mailgun_message_id = mailer_response.message_id 
  end
end
