require 'rails_helper'

describe Book do
  subject do
    FactoryBot.build(:book)
  end

  describe '#new book instance' do
    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should have default status' do
      expect(subject.status).to eq(false)
    end

    context 'should not be saved without' do
      it 'required parameters' do
        %w[title author pages price].each do |param|
          subject.update(param.to_sym => nil)
          expect (subject.save).eql?(false)
        end
      end
    end
  end

  describe '#taken_book' do
    it 'should be taken' do
      expect(FactoryBot.build(:taken_book).status).to eq(true)
    end
  end

  describe '#available_book' do
    it 'should be available' do
      expect(FactoryBot.build(:available_book).status).to eq(false)
    end
  end

end


