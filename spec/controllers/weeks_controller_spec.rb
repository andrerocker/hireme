describe WeeksController do
  let(:user) { FactoryGirl.create(:user) }
  let(:room) { FactoryGirl.create(:room) }
  let(:week) { FactoryGirl.create(:week) }

  describe "#show" do
    it "should load schedules from room and week" do
      scheds = 3.times.collect{ FactoryGirl.create(:scheduling, user: user, room: room, week: week)}
      get :show, room_id: room.id, id: week.id
      expect(response.status).to eq(200)
      expect(assigns(:schedulings)).to eq(scheds)
    end

    it "should redirect to root_path if are invalid root or week ids" do
      get :show, room_id: 0, id: 0
      expect(response).to redirect_to(root_path)
    end
  end

  describe "#schedule" do
    it "should make a schedule" do
      allow(controller).to receive(:signed_in?).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)
      post :schedule, room_id: room.id, id: week.id, day: "01", hour: "06:00"

      expect(response.status).to eq(200)
    end

    it "should unauthorize without login" do
      allow(controller).to receive(:signed_in?).and_return(false)
      post :schedule, room_id: room.id, id: week.id, day: "01", hour: "06:00"

      expect(response.status).to eq(401)
    end
  end

  describe "#remove_schedule" do
    it "should remove a schedule" do
      allow(controller).to receive(:signed_in?).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)
      delete :remove_schedule, room_id: room.id, id: week.id, day: "01", hour: "06:00"

      expect(response.status).to eq(204)
    end

    it "should unauthorize without login" do
      allow(controller).to receive(:signed_in?).and_return(false)
      delete :remove_schedule, room_id: room.id, id: week.id, day: "01", hour: "06:00"

      expect(response.status).to eq(401)
    end
  end
end
