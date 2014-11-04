require 'rails_helper'

describe TextMessage, type: :model do
  let!(:github_goal) { FactoryGirl.create(:github_goal) }

  it 'sends a text if github goal is not reached' do
    # it checks to see if that person has achieved their github goal
    github_goal.Text.send_text(github_goal.daily_commit_count, github_goal.commit_goal)
    # if not then recieve a text message

  end
end
