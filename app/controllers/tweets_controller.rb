class TweetsController < ApplicationController
  def index
    render "I am a tweet!".to_json, status: "200 OK"
    # render "I am a tweet!".to_json, status: "404 NOT FOUND"
    # render params.to_json
    # Use the render method now to specify what should be rendered to the screen
    # this 'render' method fills the request object.
    # By default, all render calls will make the status "200 OK", you only need
    # to add a status if you are changing from "200 OK" to something else.
  end
end
