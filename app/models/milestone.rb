class Milestone < ApplicationRecord
  belongs_to :investment
  validates :task, presence: true
  validates :amount, presence: true
  validates :deadline, presence: true
  validates :investment, presence: true
  def days_left
    #calculates the days left til deadline
    (deadline - Date.today).to_i #pretty much straight forward
  end

  def unlocked?
    #returns true if milestone is not unlocked
    if unlocked && accessible
      update!(unlocked:true)
    else
      update!(unlocked:false)
    end
    return unlocked
  end

  def accessible?
    accessible
  end

  def investment_index
    investment.milestones_by_nearest_deadline.index(self)
  end

end
