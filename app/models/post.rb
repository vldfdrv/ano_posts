class Post < ApplicationRecord
  belongs_to :user
  has_many :files

  STATUS_DRAFT = "черновик"
  STATUS_INSPECT = "на проверке"
  STATUS_APPROVED = "утвержден"
  STATUS_REJECTED = "отклонен"
end
