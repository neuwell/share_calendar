require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule = schedules(:one)
  end

  test "should get index" do
    get schedules_url, as: :json
    assert_response :success
  end

  test "should create schedule" do
    assert_difference('Schedule.count') do
      post schedules_url, params: { schedule: { content: @schedule.content, description: @schedule.description, id_hash: @schedule.id_hash, month: @schedule.month, year: @schedule.year } }, as: :json
    end

    assert_response 201
  end

  test "should show schedule" do
    get schedule_url(@schedule), as: :json
    assert_response :success
  end

  test "should update schedule" do
    patch schedule_url(@schedule), params: { schedule: { content: @schedule.content, description: @schedule.description, id_hash: @schedule.id_hash, month: @schedule.month, year: @schedule.year } }, as: :json
    assert_response 200
  end

  test "should destroy schedule" do
    assert_difference('Schedule.count', -1) do
      delete schedule_url(@schedule), as: :json
    end

    assert_response 204
  end
end
