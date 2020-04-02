# Execute From

Executes an application after changing directory.
All IO is piped to the caller.

## Installation

`shards install`

## Usage

`./bin/exec_from ../other_directory git ls-files`

## Client

```crystal
require "exec-from"

result = ExecFrom.exec_from(".", "echo", ["hello"])

puts result[:output].to_s # => "hello"
puts result[:exit_code] # => 0
```
