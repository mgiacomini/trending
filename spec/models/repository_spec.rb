require 'rails_helper'

RSpec.describe Repository, type: :model do
  context 'validations' do
    it { should validate_presence_of :github_id }
    it { should validate_presence_of :name }
    it { should validate_presence_of :url }

    it { should validate_uniqueness_of :github_id }
  end
end
