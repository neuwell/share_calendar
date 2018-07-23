require 'test_helper'

class ScheduleItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule_item = schedule_items(:one)
  end

  test "should get index" do
    get schedule_items_url, as: :json
    assert_response :success
  end

  test "should create schedule_item" do
    assert_difference('ScheduleItem.count') do
      post schedule_items_url, params: { schedule_item: { color: @schedule_item.color, date: @schedule_item.date, memo: @schedule_item.memo, schedule_id: @schedule_item.schedule_id } }, as: :json
    end

    assert_response 201
  end

  test "should show schedule_item" do
    get schedule_item_url(@schedule_item), as: :json
    assert_response :success
  end

  test "should update schedule_item" do
    patch schedule_item_url(@schedule_item), params: { schedule_item: { color: @schedule_item.color, date: @schedule_item.date, memo: @schedule_item.memo, schedule_id: @schedule_item.schedule_id } }, as: :json
    assert_response 200
  end

  test "should destroy schedule_item" do
    assert_difference('ScheduleItem.count', -1) do
      delete schedule_item_url(@schedule_item), as: :json
    end

    assert_response 204
  end
end
