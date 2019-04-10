# Change directory
Dir.cd(ARGV.shift)

# Execute process
Process.run(ARGV.shift, ARGV,
  input: Process::Redirect::Inherit,
  output: Process::Redirect::Inherit,
  error: Process::Redirect::Inherit
)
