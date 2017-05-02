module Gitlab
  module Template
    class DockerfileTemplate < BaseTemplate
      def content
        explanation = "# This file is a template, and might need editing before it works on your project."
        [explanation, super].join("\n")
      end

      class << self
        def extension
          '.Dockerfile'
        end

        def categories
          {
            "General" => ''
          }
        end

        def base_dir
          Rails.root.join('vendor/Dockerfile')
        end

        def finder(project = nil)
          Gitlab::Template::Finders::GlobalTemplateFinder.new(self.base_dir, self.extension, self.categories)
        end
      end
    end
  end
end
