module NavbarHelper
  def user_move_to(email, link)
    sign_in(email, "123456")

    click_on "School 123"
    click_on link
  end
end
