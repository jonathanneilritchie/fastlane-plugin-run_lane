describe Fastlane::Actions::RunLaneAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The run_lane plugin is working!")

      Fastlane::Actions::RunLaneAction.run(nil)
    end
  end
end
