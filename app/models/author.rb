class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  has_many :posts

  def change_password(attrs)
    update(password:              attrs[:new_password],
           password_confirmation: attrs[:new_password_confirmation])
  end

  extend Enumerize

  ACCESS_LEVELS = %i(user admin).freeze

  enumerize :access_level,
            in: ACCESS_LEVELS,
            default: ACCESS_LEVELS.first,
            scope: true

  validates :password, length: { minimum: 3 }, on: :create
end
