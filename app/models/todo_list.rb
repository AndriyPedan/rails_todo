class TodoList < ActiveRecord::Base
  has_many :todos

  validates :title, presence: true
end
