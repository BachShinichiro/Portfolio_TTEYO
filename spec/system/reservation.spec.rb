

require 'rails_helper'
RSpec.describe '予約機能', type: :system do
  describe '新規作成機能' do
    before do
      @client = FactoryBot.create(:client_user)
      @client.skip_confirmation!
      @client.save!
      @user = FactoryBot.create(:second_user)
      @user.skip_confirmation!
      @user.save!
    end
      let!(:event) { FactoryBot.create(:event,user: @client) }
    context '一般ユーザーはイベントに予約することができる' do
      it 'ログインユーザーは予約ページに行くことができる' do
        visit new_user_session_path
        fill_in "Eメール", with: @user.email
        fill_in "パスワード", with: @user.password
        click_on 'ログイン'
        click_on :topimage
        click_on "詳細/予約はこちらから", match: :first
        expect(page).to have_content '予約する'
      end
      it '一般ユーザーは予約を作成できる' do
        visit new_user_session_path
        fill_in "Eメール", with: @user.email
        fill_in "パスワード", with: @user.password
        click_on 'ログイン'
        click_on :topimage
        click_on "詳細/予約はこちらから", match: :first
        click_on '予約する', match: :first
        fill_in :reservation_date , with: DateTime.new(2020, 10, 31, 23, 55, 0)
        select '一般席', from: :reservation_ticket_type
        fill_in :reservation_number_of_ticket, with: "1"
        click_on "Create Reservation"
        expect(page).to have_content '予約完了いたしました！'
      end
      it '管理ユーザーはイベントをできる' do
        visit new_user_session_path
        fill_in "Eメール", with: @client.email
        fill_in "パスワード", with: @client.password
        click_on 'ログイン'
        visit  new_event_path
        expect(page).to have_content 'New Event'
      end
      it '一般ユーザーはイベント作成できない' do
        visit new_user_session_path
        fill_in "Eメール", with: @user.email
        fill_in "パスワード", with: @user.password
        click_on 'ログイン'
        visit  new_event_path
        expect(page).to have_content '一般ユーザーは投稿できません'
      end
    end
  end
end