module AcceptanceMacros
  def login(user)
    visit new_user_session_path
    fill_in 'Логин', with: user.email
    fill_in 'Пароль', with: user.password
    click_on 'Войти'
  end
end
