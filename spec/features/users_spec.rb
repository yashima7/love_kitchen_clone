require 'rails_helper'

RSpec.feature "Users", type: :feature do
  before do
      FactoryBot.create(:bob)
    end
  
  scenario '新しいユーザーを作成できること' do
    visit root_path
    click_link "無料会員登録"
    expect {
      fill_in "ユーザー名", with: "alice"
      fill_in "メールアドレス", with: "alice@email.com"
      fill_in "パスワード", with: "password"
      fill_in "確認用パスワード", with: "password"
      click_on "登録する"
    }.to change(User, :count).by(1)  
    expect(page).to have_content "アカウント登録が完了しました。"
  end
  scenario 'プロフィールを編集出来ること' do
    visit root_path
    click_link "ログイン"
    fill_in 'メールアドレス', with: "bob@email.com"
    fill_in 'パスワード', with: "password"
    click_on "ログインする"
    click_link "プロフィールを編集する"
    fill_in "自己紹介", with: "hello, my name is bob."
    click_on "更新する"
    expect(page).to have_content "アカウント情報を変更しました。"

  end
end