# :nodoc:
module Exporter
  # :nodoc:
  class CustomExporter
    attr_reader :dataset
    def initialize(_dataset)
    end

    def export_dataset
      raise NoMethodError
    end
  end
end
