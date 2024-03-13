require "test_helper"

class MyAppIntegrationTest < ActionDispatch::IntegrationTest
  # Test for user registration
  test "register test" do
    user_data = { email: "overdose@email.com", password: "tamana123", password_confirmation: "tamana123" }
    post '/api/v1/sign_up', params: { user: user_data }

    assert_response :created
    assert_not_nil User.find_by(email: user_data[:email])

    puts "Register Test: PASSED ✅"
  end

  # Test for user login
  test "login test" do
    user = User.create!(email: "overdose@email.com", password: "tamana123", password_confirmation: "tamana123")

    post '/api/v1/sign_in', params: { email: user.email, password: user.password }

    assert_response :success
    assert_includes response.body, 'Sign-in successful!'

    puts "Login Test: PASSED ✅"
  end

  # Test for creating a category
  test "create category test" do
    user = User.create!(email: "overdose@email.com", password: "tamana123", password_confirmation: "tamana123")
    post '/api/v1/sign_in', params: { email: user.email, password: user.password }
    assert_response :success
    assert_includes response.body, 'Sign-in successful!'

    category_data = { name: "ValidName", user_id: user.id }
    post '/api/v1/category', params: category_data
    assert_response :success
    assert_includes response.body, 'ValidName'

    puts "Create Category Test: PASSED ✅"
  end

  # Test for updating a category
  test "update category test" do
    user = User.create!(email: "overdose@email.com", password: "tamana123", password_confirmation: "tamana123")
    post '/api/v1/sign_in', params: { email: user.email, password: user.password }
    assert_response :success
    assert_includes response.body, 'Sign-in successful!'

    category = Category.create!(name: "ValidName", user_id: user.id)
    updated_name = "NotValid"
    patch "/api/v1/category/#{category.id}", params: { name: updated_name }
    assert_response :success
    assert_includes response.body, updated_name

    puts "Update Category Test: PASSED ✅"
  end

  # Test for creating a task
  test "create task test" do
    user = User.create!(email: "overdose@email.com", password: "tamana123", password_confirmation: "tamana123")
    post '/api/v1/sign_in', params: { email: user.email, password: user.password }
    assert_response :success
    assert_includes response.body, 'Sign-in successful!'

    category = Category.create!(name: "ValidName", user_id: user.id)
    assert_response :success

    task_data = { taskname: "Test Task", taskdescription: "This is a test task", category_id: category.id, user_id: user.id, end_date: Date.today + 1, isCompleted: false }
    post '/api/v1/tasklist', params: task_data
    assert_response :success
    assert_includes response.body, 'Test Task'

    puts "Create Task Test: PASSED ✅"
  end

  # Test for updating a task
  test "update task test" do
    user = User.create!(email: "overdose@email.com", password: "tamana123", password_confirmation: "tamana123")
    post '/api/v1/sign_in', params: { email: user.email, password: user.password }
    assert_response :success
    assert_includes response.body, 'Sign-in successful!'

    category = Category.create!(name: "ValidName", user_id: user.id)
    assert_response :success

    task = TaskTable.create!(taskname: "Test Task", taskdescription: "This is a test task", category_id: category.id, user_id: user.id, end_date: Date.today + 1, isCompleted: false)
    assert_response :success

    updated_task_data = { taskname: "Updated Test Task", taskdescription: "This is the updated test task description", end_date: Date.today + 2 }
    patch "/api/v1/tasklist/#{task.id}", params: updated_task_data
    assert_response :success
    assert_includes response.body, 'Updated Test Task'

    puts "Update Task Test: PASSED ✅"
  end

  # Test for deleting a task
  test "delete task test" do
    user = User.create!(email: "overdose@email.com", password: "tamana123", password_confirmation: "tamana123")
    post '/api/v1/sign_in', params: { email: user.email, password: user.password }
    assert_response :success
    assert_includes response.body, 'Sign-in successful!'

    category = Category.create!(name: "ValidName", user_id: user.id)
    assert_response :success

    task = TaskTable.create!(taskname: "Test Task", taskdescription: "This is a test task", category_id: category.id, user_id: user.id, end_date: Date.today + 1, isCompleted: false)
    assert_response :success

    delete "/api/v1/tasklist/#{task.id}"
    assert_response :success
    assert_empty TaskTable.where(id: task.id)

    puts "Delete Task Test: PASSED ✅"
  end
end
