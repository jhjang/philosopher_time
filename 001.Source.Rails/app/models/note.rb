class Note < ActiveRecord::Base
  belongs_to :device

  validates :device_id, presence: true
  validates :worked_at, presence: true
end
