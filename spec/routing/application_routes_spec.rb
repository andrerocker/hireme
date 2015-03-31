describe "home controller routes" do
  it "routes / to home#index" do
    expect(:get => "/").to route_to(:controller => "home", :action => "index")
  end
end

describe "weeks controller routes" do
  it "routes get /rooms/1/weeks/1 to weeks#show" do
    expect(:get => "/rooms/1/weeks/1").to route_to(
      :controller => "weeks", 
      :action => "show", 
      "room_id": "1",
      "id": "1"
    )
  end

  it "routes post /rooms/1/weeks/1/schedule to weeks#schedule" do
    expect(:post => "/rooms/1/weeks/1/schedule").to route_to(
      :controller => "weeks", 
      :action => "schedule", 
      "room_id": "1",
      "id": "1"
    )
  end

  it "routes delete /rooms/1/weeks/1/schedule to weeks#remove_schedule" do
    expect(:delete => "/rooms/1/weeks/1/schedule").to route_to(
      :controller => "weeks", 
      :action => "remove_schedule", 
      "room_id": "1",
      "id": "1"
    )
  end
end

describe "devise omniauth controller routes" do
  it "routes get|post /users/auth/github to users/omniauth_callbacks#passthru" do
    expect(:get => "/users/auth/github").to route_to(
      :controller => "users/omniauth_callbacks", 
      :action => "passthru", 
      "provider": "github"
    )

    expect(:post => "/users/auth/github").to route_to(
      :controller => "users/omniauth_callbacks", 
      :action => "passthru", 
      "provider": "github"
    )
  end

  it "routes get /sign_out to devise/sessions#destroy" do
    expect(:get => "/sign_out").to route_to(
      :controller => "devise/sessions", 
      :action => "destroy"
    )
  end
end
