require 'rails_helper' 

RSpec.describe Post, type: :model do
  let(:user) {build(:user,id: 1)}
  let(:post) {build(:post,id: 1,user_id: 1,content:"tarezou")}


  describe 'validation' do
      it 'user_id,id is がnullではない' do   
        expect(post.valid?).to eq(true)
      end

      it 'content id  null' do
        post.content = ""
        expect(post.valid?).to eq(false)
      end


      it 'user_id is null' do
        post.user_id = ""
        expect(post.valid?).to eq(false)
      end
  end

end

