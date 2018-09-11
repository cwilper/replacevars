# replacevars

Replace environment variable references in a file.

## Installation

[Download the script](https://raw.githubusercontent.com/cwilper/replacevars/master/replacevars), make it executable,
and put it in your `PATH`.

You can also source the script and [use as it a bash function](https://raw.githubusercontent.com/cwilper/replacevars/master/sourcing-example.sh),
avoiding the need to export variables.

## Usage

```
replacevars [-t] ( -f file | -i file | - ) [ldelim] [rdelim]
```

Where:
  * `-t` prints variables in the input in the order they appear, and exits (for testing)
  * `-f` gets input from a file and prints the result to `stdout`
  * `-i` gets input from a file and overwrites it with the result
  * `-` gets input from `stdin` and prints the result to `stdout`
  * `ldelim` is the left delimiter for variable references (default is `{{`)
  * `rdelim` is the right delimiter for variable references (default is `}}`)

## Examples

```
  command> echo "Hi {{first}} {{last}}" | replacevars -
   stderr> Undefined variable: first

  command> echo "Hi {{first}} {{last}}" | first=Some last=Person replacevars -
   stdout> Hi Some Person

     file> Hi ${first} ${last}
  command> first=Some last=Person replacevars -f file '${' '}'
   stdout> Hi Some Person

     file> Hi {{first}} {{last}}
  command> first=Some last=Person replacevars -i file
     file> Hi Some Person
   stdout> 2 variables replaced

     file> Hi Some Person
  command> first=Some last=Person replacevars -i file
     file> Hi Some Person
   stdout> 0 variables replaced
```
