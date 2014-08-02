require_relative '../test_helper'

class ApiV0GoalsControllerTest < ActionController::TestCase

  setup do

    @controller = Api::V0::GoalsController.new
    @pizza = Goal.new
    @pizza.amount = 1000
    @pizza.start_at = 5.days.ago
    @pizza.end_at = Date.today
    @pizza.concept = "Pizza"
    @pizza.daily_goal = 200
    @pizza.total_saved = 0
    @pizza.user_id = 1234
    @pizza.save!

    @tacos = Goal.new
    @tacos.amount = 150
    @tacos.start_at = Date.new(2014, 7, 15)
    @tacos.end_at = Date.new(2014, 8, 30)
    @tacos.concept = "Tacos"
    @tacos.daily_goal = 10
    @tacos.total_saved = 0
    @tacos.user_id = 666
    @tacos.save!

  end

  test "should create goal" do
    assert_difference('Goal.count') do
      post( :create, :goal => {:amount=>10, :start_at=>Date.new(2014, 7, 30), :end_at=>Date.new(2014, 7, 31), :concept=>"chelas", :daily_goal=>10, :total_saved=>0, :user_id=>4321})
    end
    assert_response :success

    # { status: 201, goal.id }
    json = JSON.parse(@response.body)
    assert_nil(json["content"]['error'])
    assert_equal('201',json["status"])
  end

  test "should show goal" do
    get :show, id: @tacos.id
    assert_response :success

    # { status: 302, goal }
    json = JSON.parse(@response.body)
    assert_nil(json["content"]['error'])
    assert_equal('302',json["status"])
  end

end
