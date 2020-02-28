# Change directory
Dir.cd(ARGV.shift)

# Execute process
status = Process.run(ARGV.shift, ARGV,
  input: Process::Redirect::Inherit,
  output: Process::Redirect::Inherit,
  error: Process::Redirect::Inherit
)

# https://unix.stackexchange.com/questions/394639/why-do-high-exit-codes-on-linux-shells-256-not-work-as-expected
exit (status.exit_code % 256)
