class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  has_many :posts

  validates_presence_of :name, on: :update

  def change_password(attrs)
    update(password:              attrs[:new_password],
           password_confirmation: attrs[:new_password_confirmation])
  end

  def display_name
    if name.present?
      name
    else
      'Author'
    end
  end
end
