require 'rails_helper'
RSpec.describe 'ユーザ管理機能', type: :system do
  describe '新規作成機能' do
    context 'ユーザを新規作成した場合' do
      it '作成したユーザが表示される' do
        visit new_user_registration_path
        fill_in "名前", with: 'user1'
        fill_in "メールアドレス", with: 'user_1@example.com'
        fill_in "パスワード", with: 'password1'
        fill_in "確認用パスワード", with: 'password1'
        click_button "アカウント登録"
        expect(page).to have_content '本人確認用のメールを送信しました'
      end
    end
    context 'ユーザがログインせず投稿を作成しようとした場合' do
      it 'ログイン画面に遷移する' do
        visit new_event_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'セッション機能' do
    before do
      @user = FactoryBot.create(:client_user)
      @user.skip_confirmation!
      @user.save!
      @client = FactoryBot.create(:second_user)
      @client.skip_confirmation!
      @client.save!
    end
    context 'ログイン機能' do
      it 'ログインができる' do
        visit new_user_session_path
        fill_in "メールアドレス", with: 'picasso@picasso.com'
        fill_in "パスワード", with: 'password'
        click_on 'ログイン'
        expect(page).to have_content 'ログインしました'
      end

      it 'ログアウトもできる' do
        visit new_user_session_path
        fill_in "メールアドレス", with: 'picasso@picasso.com'
        fill_in "パスワード", with: 'password'
        click_on 'ログイン'
        click_on 'LOG OUT'
        expect(page).to have_content 'ログアウトしました'
      end

      it 'ログイン後に一覧画面に飛ぶ' do
        visit new_user_session_path
        fill_in "メールアドレス", with: @user.email
        fill_in "パスワード", with: @user.password
        click_on 'ログイン'
        visit events_path
        expect(current_path).to eq events_path
      end

      it '新規登録したら確認のメールが飛ぶ' do
        visit new_user_registration_path
        fill_in "名前", with: '角消し'
        fill_in "メールアドレス", with: 'kadokeshi_1@example.com'
        fill_in "パスワード", with: 'password'
        fill_in "確認用パスワード", with: 'password'
        click_button "アカウント登録"
        expect(page).to have_content '本人確認用のメールを送信しました。'
      end
      it 'ログインした後、ログインに行けない' do
        visit new_user_session_path
        fill_in "メールアドレス", with: 'picasso@picasso.com'
        fill_in "パスワード", with: 'password'
        click_on 'ログイン'
        visit new_user_session_path
        expect(page).to have_content 'すでにログインしています'
      end
      it 'ログインした後、新規登録に行けない' do
        visit new_user_session_path
        fill_in "メールアドレス", with: 'picasso@picasso.com'
        fill_in "パスワード", with: 'password'
        click_on 'ログイン'
        visit new_user_session_path
        expect(page).to have_content 'すでにログインしています'
      end
    end
  end
end