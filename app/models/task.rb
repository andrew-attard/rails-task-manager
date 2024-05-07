class Task < ApplicationRecord
  # A sample validation, which in this case just confirms that a value is provided
  # to the title field
  validates :title, presence: true
end
