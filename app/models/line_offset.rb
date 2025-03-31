class LineOffset < ApplicationRecord
  validates :line_number, presence: true, uniqueness: true
  validates :offset, presence: true
end
