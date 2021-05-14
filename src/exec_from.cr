require "json"

module ExecFrom
  struct Result
    include JSON::Serializable

    getter status : Process::Status
    getter output : IO

    def initialize(@status, @output)
    end
  end

  def self.exec_from(
    directory : String,
    command : String,
    arguments : Enumerable(String) = [] of String,
    environment : Process::Env = nil,
    clear_environment : Bool = false,
    capture_stderr : Bool = true,
    input : IO | Process::Redirect = Process::Redirect::Close,
    output : IO = IO::Memory.new
  ) : Result
    status = Process.run(
      command: "./bin/exec_from",
      args: [directory, command].concat(arguments),
      input: Process::Redirect::Close,
      env: environment,
      clear_env: clear_environment,
      output: output,
      error: capture_stderr ? output : Process::Redirect::Close,
    )

    Result.new(status, output)
  end
end
