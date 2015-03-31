describe Scheduling do
  let(:user) { FactoryGirl.create(:user) } 
  let(:room) { FactoryGirl.create(:room) } 
  let(:week) { FactoryGirl.create(:week) } 

  context "schedules for a room on a week" do
    it "should get schedules for a room on a week" do
      scheda = FactoryGirl.create(:scheduling, room: room, week: week, user: user)
      schedb = FactoryGirl.create(:scheduling, room: room, week: week, user: user)
      schedc = FactoryGirl.create(:scheduling)

      results = subject.class.for_a_room_and_week(room.id, week.id)
      expect(results).to include(scheda, schedb)
      expect(results).not_to include(schedc)
    end
  end

  context "make schedule" do
    it "schedule just one row for schedule" do
      expect {
        subject.class.make(user, room.id, week.id, 1, "09:00")
        subject.class.make(user, room.id, week.id, 1, "09:00")
        subject.class.make(user, room.id, week.id, 1, "09:00")
        subject.class.make(user, room.id, week.id, 1, "10:00")
        subject.class.make(user, room.id, week.id, 1, "10:00")
      }.to change { Scheduling.count }.by(2)
    end

    it "schedule day and hour just one time" do
      expect {
        subject.class.make(user, room.id, week.id, 1, "09:00")
        subject.class.make(FactoryGirl.create(:user), room.id, week.id, 1, "09:00")
      }.to change { Scheduling.count }.by(1)
    end
  end
end
