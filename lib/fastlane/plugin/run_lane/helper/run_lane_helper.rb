module Fastlane
  module Helper
    class RunLaneHelper
      # class methods that you define here become available in your action
      # as `Helper::RunLaneHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the run_lane plugin helper!")
      end
    end
  end
end
