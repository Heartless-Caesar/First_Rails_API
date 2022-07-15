require "test_helper"

class SituationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @situation = situations(:one)
  end

  test "should get index" do
    get situations_url, as: :json
    assert_response :success
  end

  test "should create situation" do
    assert_difference("Situation.count") do
      post situations_url, params: { situation: { name: @situation.name } }, as: :json
    end

    assert_response :created
  end

  test "should show situation" do
    get situation_url(@situation), as: :json
    assert_response :success
  end

  test "should update situation" do
    patch situation_url(@situation), params: { situation: { name: @situation.name } }, as: :json
    assert_response :success
  end

  test "should destroy situation" do
    assert_difference("Situation.count", -1) do
      delete situation_url(@situation), as: :json
    end

    assert_response :no_content
  end
end
