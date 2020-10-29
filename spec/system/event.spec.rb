require 'rails_helper'
RSpec.describe 'イベント管理機能', type: :system do
  describe '投稿一覧画面' do
      let!(:client) { FactoryBot.create(:client_user) }
      let!(:event) { FactoryBot.create(:event,user: client) }
    before do
      # @event2 = FactoryBot.create(:event2, user: @user)
      visit new_user_session_path
      fill_in "Eメール", with: "user@example.com"
      fill_in "パスワード", with: "111111"
      click_button 'ログイン'
    end
    context '投稿を作成した場合' do
      it '作成済みの投稿が表示される' do
        visit events_path
        expect(page).to have_content '勇気とジュリエット'
      end

      it 'ログインしなくても一覧が見れる' do
        visit events_path
        expect(page).to have_content '勇気とジュリエット'
      end
    end

    context '検索をした場合' do
      it "タイトル検索ができる" do
        visit events_path
        fill_in :q_event_name_cont, with: '勇気と'
        click_button '検索'
        expect(page).to have_content '勇気とジュリエット'
      end

      it "検索が失敗する" do
        visit events_path
        fill_in :q_event_name_cont, with: '元気と'
        click_button '検索'
        expect(page).to_not have_content '勇気とジュリエット'
      end
    end
  end
end