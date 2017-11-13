require 'spec_helper'

describe Review do
  describe '#best_review_scope' do
    it 'should be best' do
      expect(FactoryBot.build(:best_review).stars).to eq 5
    end
  end

  describe '#average_review_scope' do
    it 'should be average' do
      expect(1..4).to cover(FactoryBot.build(:average_review).stars)
    end
  end
end


