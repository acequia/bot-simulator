class Credentials
  def self.host
    ENV['CONEJO_HOST']
  end

  def self.username
    ENV['CONEJO_USER']
  end

  def self.password
    ENV['CONEJO_PASS']
  end
end
