module ExecFrom
  def self.exec_from(
    directory : String,
    command : String,
    arguments : Enumerable(String) = [] of String,
    environment : Process::Env = nil,
    clear_environment : Bool = false,
    input : IO | Process::Redirect = Process::Redirect::Close
  ) : NamedTuple(output: IO, exit_code: Int32)
    output = IO::Memory.new
    result = Process.run(
      command: "./bin/exec_from",
      args: [directory, command].concat(arguments),
      input: Process::Redirect::Close,
      env: environment,
      clear_env: clear_environment,
      output: output,
      error: output,
    )

    {
      output:    output,
      exit_code: result.exit_code,
    }
  end
end
