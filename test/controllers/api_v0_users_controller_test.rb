require_relative '../test_helper'

class ApiV0UsersControllerTest < ActionController::TestCase
  setup do
    @controller=Api::V0::UsersController.new
    @user = User.new
    @user.email = "user@user.com"
    @user.password = @user.password_confirmation = "12345678"
    @user.save!
  end

  test "sign in validate if email exist" do
    post( :sign_in, :user => {:email=>@user.email, :password=>@user.password})
    assert_response :success

    # { status: true, user_id }
    json = JSON.parse(@response.body)
    assert_nil(json["content"]['error'])
    assert_equal('200',json["status"])
  end

  test "sign in validate if email doesn't exist" do
    post( :sign_in, :user => {:email=>'jjsjsjs@gmail.com', :password=>@user.password})
    assert_response :success

    # { estatus: true, user_id }
    json = JSON.parse(@response.body)
    assert(json["content"]['error'])
    assert_equal('500',json["status"])
  end

  test "sign in validate, password is incorrect" do
    post( :sign_in, :user => {:email=>@user.email, :password=>'patobook'})
    assert_response :success

    # { estatus: true, user_id }
    json = JSON.parse(@response.body)
    assert(json["content"]['error'])
    assert_equal('401',json["status"])
  end

  test "sign up validate if all data have already captured" do
    post( :sign_up, :user => {:first_name => 'Pablo', :last_name => 'Casanova',:email=>'pablo@gmail.com', :password=>'patobook', :password_confirmation=>'patobook'})
    assert_response :success

    json = JSON.parse(@response.body)
    assert_nil(json["content"]["error"])
    assert_equal('200',json['status'])
  end

  test "sign up validate if email already exist" do
    post( :sign_up, :user => {:first_name => 'Pablo', :last_name => 'Casanova',:email=>@user.email, :password=>'patobook', :password_confirmation=>'patobook'})
    assert_response :success

    json = JSON.parse(@response.body)
    assert(json["content"]["error"])
    assert_equal('500',json['status'])
  end

  test "sign up validate if email is invalid" do
    post( :sign_up, :user => {:first_name => 'Pablo', :last_name => 'Casanova',:email=>'ssjjsjss@com', :password=>'patobook', :password_confirmation=>'patobook'})
    assert_response :success

    json = JSON.parse(@response.body)
    assert(json["content"]["error"])
    assert_equal('500',json['status'])
  end

  test "sign up validate if password's doesn't match" do
    post( :sign_up, :user => {:first_name => 'Pablo', :last_name => 'Casanova',:email=>@user.email, :password=>'patobook', :password_confirmation=>'patobook2'})
    assert_response :success

    json = JSON.parse(@response.body)
    assert(json["content"]["error"])
    assert_equal('500',json['status'])
  end

  # test "show user with email" do
  #   get(:show, :user => {:email=>'pablo@gmail.com'})
  #   assert_response :success
  #
  #   json = JSON.parse(@response.body)
  #   assert_nil(json["content"]["error"])
  #   assert_equal('401',json['status'])
  # end

end
