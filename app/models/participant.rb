# == Schema Information
#
# Table name: participants
#
#  id         :integer          not null, primary key
#  role       :integer
#  user_id    :integer          not null
#  task_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Participant < ApplicationRecord
  #enum role: { responsible: 1, follower: 2 }
  belongs_to :user
  belongs_to :task
end
