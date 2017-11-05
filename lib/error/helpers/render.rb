# Helper for Error module
module Error::Helpers
  # Render class
  class Render
    def self.json(error, status, message)
      {
        status: status,
        error: error,
        message: message
      }.as_json
    end
  end
end
