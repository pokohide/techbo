class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :entries

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

  def image_url(style)
    if avater.present?
      avater.s3_object(style).url_for(:read, secure: true)
    else
      'https://s3-ap-northeast-1.amazonaws.com/beeapp-production/no-img.png'
    end
  end
end
