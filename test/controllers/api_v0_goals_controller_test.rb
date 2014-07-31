require_relative '../test_helper'

class ApiV0GoalsControllerTest < ActionController::TestCase

  setup do

    @controller = Api::V0::GoalsController.new
    @goal = Goal.new
    @goal.amount = 5000
    @goal.start_at = 5.days.ago
    @goal.end_at = Date.today
    @goal.concept = "Pizza"
    @goal.user_id = 1
    @goal.save!

  end

  test "if we can achive a goal" do

    post(:create, :goal => {:amount => @goal.amount, :start_at => @goal.start_at, :end_at => @goal.end_at, :concept => @goal.concept, :user_id => @goal.user_id})
    assert_response :success

    # { status: true, goal }
    json = JSON.parse(@response.body)
    assert_nil(json["content"]['errors'])
    assert_equal('201',json["status"])

  end




  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:goals)
  # end
  #
  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
  #
  # test "should create goal" do
  #   assert_difference('Goal.count') do
  #     post :create, goal: { amount: @goal.amount, date: @goal.date, description: @goal.description, name: @goal.name }
  #   end
  #
  #   assert_redirected_to goal_path(assigns(:goal))
  # end
  #
  # test "should show goal" do
  #   get :show, id: @goal
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get :edit, id: @goal
  #   assert_response :success
  # end
  #
  # test "should update goal" do
  #   patch :update, id: @goal, goal: { amount: @goal.amount, date: @goal.date, description: @goal.description, name: @goal.name }
  #   assert_redirected_to goal_path(assigns(:goal))
  # end
  #
  # test "should destroy goal" do
  #   assert_difference('Goal.count', -1) do
  #     delete :destroy, id: @goal
  #   end
  #
  #   assert_redirected_to goals_path
  # end

end
