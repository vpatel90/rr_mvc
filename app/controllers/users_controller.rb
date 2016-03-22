class UsersController < ApplicationController
  def index
    if params[:first_name].nil? && params[:limit].nil?
      array = []
      User.all.each do |user|
        array << "first name: #{user.first_name} last name: #{user.last_name} id: #{user.id} age: #{user.age}"
      end
      render array.to_json
    else
      analyze_optional_params
    end
  end

  def single
    return render "404 NOT FOUND".to_json, status: "404, NOT FOUND" if params[:id].to_i > User.all.length
    request = User.all.select do |user|
      user.id == params[:id].to_i
    end
    user = request[0]
    render "first name: #{user.first_name} last name: #{user.last_name} id: #{user.id} age: #{user.age}".to_json
  end

  def analyze_optional_params
    if params[:first_name].nil?
      get_users_at_range
    else
      get_users_with_first_name
    end
  end

  def get_users_with_first_name
    user_names = []
    first_names = User.all.map { |user| user.first_name }
    requested_names = first_names.select {|names| names.match(/#{params[:first_name].capitalize}/)}
    User.all.each do |user|
      if requested_names.any? {|name| name == user.first_name}
        user_names << "First Name: #{user.first_name} Last Name: #{user.last_name} ID: #{user.id} Age: #{user.age}"
      end
    end
    render user_names.to_json
  end

  def get_users_at_range
    start_index = params[:limit].to_i - 1
    total_length = start_index + params[:offset].to_i
    if total_length > User.all.size - 1
      render "404 not found", status: "404, NOT FOUND"
    else
      user_names = []
      (start_index...total_length).each do |index|
        user = User.all[index]
        user_names << "First Name: #{user.first_name} Last Name: #{user.last_name} ID: #{user.id} Age: #{user.age}"
      end
      render user_names.to_json
    end
  end

  def add
    if params["first_name"].nil? || params["last_name"].nil? || params["age"].nil?
      return render "400 bad request", status: "400, BAD REQUEST"
    end
    user = User.new(params["first_name"], params["last_name"], User.all.size + 1, params["age"])
    render "first name: #{user.first_name} last name: #{user.last_name} id: #{user.id} age: #{user.age}".to_json
  end

  def update
    return "404 not found" if params[:id].nil?
    binding.pry

  end


end
