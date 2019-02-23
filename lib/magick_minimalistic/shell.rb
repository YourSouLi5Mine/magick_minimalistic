module Shell
  def run(command)
    `#{command}`
  end
end
