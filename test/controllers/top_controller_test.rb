require "test_helper"

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should get index when logged in" do
    user = User.create!(
      name: "テストユーザー",
      email: "top-test@example.com",
      password: "password123",
      password_confirmation: "password123",
      address: "東京都",
      role: "resident"
    )

    post login_path, params: {
      email: user.email,
      password: "password123"
    }

    get root_path
    assert_response :success
  end

  test "should redirect to login when not logged in" do
    get root_path
    assert_redirected_to login_path
  end
end
