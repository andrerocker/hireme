describe HomeController do
  describe "#index" do
    subject { get :index }

    it "should redirect to room_week_path" do
      expect(subject).to redirect_to(room_week_path(assigns(:room).id, assigns(:week).id))
    end
  end
end
