require 'rails_helper'

RSpec.describe User, type: :model do
   
  let(:user){ build(:user)}


  describe 'バリデーション' do
    it 'nameとemailとパスワードの値が設定されていれば、OK' do
      expect(user.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      user.username = ''
      expect(user.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      user.email = ''
      expect(user.valid?).to eq(false)
    end
  end
end
