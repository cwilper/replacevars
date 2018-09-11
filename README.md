# replacevars

Simple variable replacement for text files, with `bash`.

## Installation

TBD

## Usage

```
replacevars [-i] file [ldelim] [rdelim]
```

Where:

* `-i` replaces the file in place. By default, the modified text will go to standard output.
* `file` is the input file with variables to be replaced.
* `ldelim` is the left delimiter for variable names in the source file. By default, this is `{{`.
* `rdelim` is the right delimiter for variable names in the source file. By default, this is `}}`.

Note:
* When specifying custom delimiters, you may need to escape some characters  with `\` so that `sed` interprets
them correctly.

## Examples

## Standard delimiters, standard output

Given the input file:

```
Dear {{name}},

This is example {{num}} of {{max}} possible.
```

This command:

```bash
Yields this output:
name="Sir or Madam" num=one max=many ./replacevars source-file.txt
```

Prints the following:

```
Dear Some Person,

This is example 1 of many possible.
```

## Custom delimiters, in place

Given the input file:

```
${holiday} is my favorite holiday. It happens ${frequency}.
```

..this command:

```bash
holiday=Halloween frequency=yearly ./replacevars -i source-file.txt '${' '}'
```

..replaces the file with:

```
Halloween is my favorite holiday. It happens yearly.
```

..and prints the following:

```
3 variables replaced
```

Running the same command again will have no effect, and will print the following:

```
0 variables replaced
```
