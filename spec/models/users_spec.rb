describe User do
  context "works with devise" do
    it "first or create user from omniauth payload" do
      info = OpenStruct.new(email: "andre@gmail.com", name: "teste")
      auth = OpenStruct.new(provider: "bacon", uid: "xpto1234", info: info)
      user = subject.class.from_omniauth(auth)

      expect(user.name).to eq info[:name]
      expect(user.email).to eq info[:email]
      expect(user.provider).to eq auth[:provider]
      expect(user.uid).to eq auth[:uid]
    end

    it "should respond to new_with_session" do
      expect(subject.class).to respond_to :new_with_session
    end
  end
end
