class InvalidInputFormat < StandardError

  def message
    'Input format has to be like this: "Home Team 0 - 0 Away Team"'
  end

end