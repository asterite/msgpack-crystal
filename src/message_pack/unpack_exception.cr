# Raised on invalid MessagePack strings.
class MessagePack::UnpackException < Exception
  # The line number where the invalid MessagePack was detected.
  getter byte_number

  # Creates a ParseException with the given message and byte number.
  def initialize(message, @byte_number)
    super "#{message} at #{@byte_number}"
  end
end
