class Post < ApplicationRecord
  belongs_to :user

  STATUS_DRAFT = "черновик"
  STATUS_INSPECT = "на проверке"
  STATUS_APPROVED = "утвержден"
  STATUS_REJECTED = "отклонен"
end
