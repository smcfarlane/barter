class Email < ActiveRecord::Base
  belongs_to :user_info
  belongs_to :user
end