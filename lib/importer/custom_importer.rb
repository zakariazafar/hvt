# :nodoc:
module Importer
  # :nodoc:
  class CustomImporter
    attr_reader :file, :uri, :clazz

    def initialize(file, uri, _clazz)
      @file = file
      @uri = uri
      @source = nil
    end

    def load_dataset
      raise NoMethodError
    end

    def from_file
      raise NoMethodError
    end

    def from_uri
      raise NoMethodError
    end
  end
end
