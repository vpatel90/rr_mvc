class Router
  def initialize(request)
    @request = request
  end

  def route
    # Routes are parsed from top down, so make sure they follow this style
    # /resource/:id/action
    # /resouce/:id
    # /resource
    # If you don't use that order, it will be like the if statements in fizzbuzz
    # syntax:
    # get(<route_string>, <controller_name_constant>, <action_name_symbol)
    # put('/tweets/:id/edit', TweetsController, :edit)
    #This route would be for putting an update for the tweet where :id is the number in the URL
    #
    # Put your routes in this array using the get, post, put, delete methods below. (remember order matters)
    [
      get('/users/:id', UsersController, :single),
      get('/tweets', TweetsController, :index),
      get('/users', UsersController, :index)
    ].find(&:itself)
  end

  private # No need to edit these, but feel free to read them to see how they work

  def get(url_str, resource, action)
    if get? && route_match?(url_str)
      resource.new(@request).send(action)
    end
  end

  def post(url_str, resource, action)
    if post? && route_match?(url_str)
      resource.new(@request).send(action)
    end
  end

  def put(url_str, resource, action)
    if put? && route_match?(url_str)
      resource.new(@request).send(action)
    end
  end

  def delete(url_str, resource, action)
    if delete? && route_match?(url_str)
      resource.new(@request).send(action)
    end
  end

  def get?
    @request[:method] == "GET"
  end

  def put?
    @request[:method] == "PUT"
  end

  def post?
    @request[:method] == "POST"
  end

  def delete?
    @request[:method] == "DELETE"
  end

  def route_match?(url)
    @request[:route] =~ Regexp.new("^#{url.gsub(/:.+?[\w(\/.+)]/, '(.+)\1')}$")
  end
end
