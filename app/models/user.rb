class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :issues
  has_many :comments
  has_many :sources
  has_many :votes
  has_many :issuecats
  has_many :requests

  before_create :send_notification

  def send_notification
    UserMail.notifysend.deliver
  end  

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
