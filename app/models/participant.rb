class Participant < ApplicationRecord
  #enum role: { responsible: 1, follower: 2 }
  belongs_to :user
  belongs_to :task
end
