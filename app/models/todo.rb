class Todo < ActiveRecord::Base
  belongs_to :todo_list

  validates :task, presence: true, length: { maximum: 50 }

  def completed?
    !completed_at.blank?
  end
end
