class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :entries
  acts_as_taggable_on :interests

  has_attached_file :avatar,
                    styles: {
                      thumb: '100x100>',
                      square: '200x200#'
                    },
                    storage: :s3,
                    s3_credentials: "#{Rails.root}/config/s3.yml",
                    path: 'users/:style/:id.:extension',
                    url: ':s3_domain_url'

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def avatar_url(style)
    if avatar.present?
      avatar.url(style)
      #avater.s3_object(style).url_for(:read, secure: true)
    else
      asset_path 'anonymous.png'
      #'https://s3-ap-northeast-1.amazonaws.com/beeapp-production/no-img.png'
    end
  end
end
