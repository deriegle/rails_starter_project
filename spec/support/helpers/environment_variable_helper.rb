module EnvironmentVariableHelper
  def set_env(key, value)
    around do |spec|
      temp = ENV[key]
      ENV[key] = value
      begin
        spec.run
      ensure
        ENV[key] = temp
      end
    end
  end
end
