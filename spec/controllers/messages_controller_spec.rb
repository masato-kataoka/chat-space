require 'rails_helper'

RSpec.describe Message, type: :controller do
  describe '#create' do
    let(:params) {{group_id: group.id, user_id: user.id, message: attributes_for(:message)}}

    context 'log in' do
      before do
        login user
      end

      context 'can save' do
        subject {
          post :create,
          params: params
        }

        it 'count up message' do
          expect{ subject }.to change(Message, :count).by(1)
        end

        it 'redirects to group_messages_path' do
          subject
          expect(response).to redirect_to(group_messages_path(group))
        end
      end
    end
  end
end
