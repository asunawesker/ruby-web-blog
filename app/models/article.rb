class Article < ApplicationRecord
  # Validations are rules that are checked before a model object is saved. If any of the checks fail, the save will
  # be aborted
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
