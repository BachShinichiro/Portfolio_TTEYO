require 'rails_helper'
RSpec.describe 'イベント管理機能', type: :system do
  describe '投稿一覧画面' do
    before do
      @user = FactoryBot.create(:client)
      @event = FactoryBot.create(:event, user: @user)
      visit new_user_session_path
      fill_in "Eメール", with: "user@example.com"
      fill_in "パスワード", with: "111111"
      click_button 'ログイン'
    end
    context '投稿を作成した場合' do
      it '作成済みの投稿が表示される' do
        visit events_path
        expect(page).to have_content 'イベント１'
  end
end