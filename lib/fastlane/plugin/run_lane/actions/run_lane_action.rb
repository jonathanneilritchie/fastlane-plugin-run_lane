module Fastlane
    module Actions
        class RunLaneAction < Action
            def self.run(params)
                options = params[:options]
                lane_name = params[:lane_name]

                UI.message("Constructing input options string...")
                options_base_string = ""
                options_string = "option"
                length_of_array = options.length - 1
                for i in 0..length_of_array do
                    options_base_string = "#{options_base_string}#{options_string}#{i}:#{options[i]} "
                end
                UI.message("Options string: '#{options_base_string}'")

                UI.message("Excuting shell command...")
                system("fastlane #{lane_name} #{options_base_string}")

                UI.success("Fastlane lane run successfully!")
            end

            def self.description
                "Run a specified fastlane lane in your project"
            end

            def self.authors
                ["Jonathan Ritchie"]
            end

            def self.details
                # Optional:
                "This plugin allows you to run a specified Fastlane lane in your project's Fastfile. This plugin is designed to be used by CI build plans where different lanes should be run basedon a number of conditions set in your CI build plan"
            end

            def self.available_options
                [
                    FastlaneCore::ConfigItem.new(key: :lane_name,
                        env_name: "LANE_NAME",
                        description: "The name of the fastlane lane in your project's Fastfile",
                        optional: false,
                    type: String),
                    FastlaneCore::ConfigItem.new(key: :options,
                        env_name: "OPTIONS",
                        description: "An array containing a number of options to be passed into the lane",
                        optional: true,
                    type: Array)
                ]
            end

            def self.is_supported?(platform)
                [:ios, :mac, :android].include?(platform)
                true
            end
        end
    end
end
