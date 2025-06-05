Definitions.

INT = [0-9]+
WHITESPACE = [\s\t\n\r]

Rules.

{INT}         : {token, {int, TokenLine, list_to_integer(TokenChars)}}.
mul           : {token, {mul, TokenLine}}.
do\(\)        : {token, {do, TokenLine}}.
don't         : {token, {dont, TokenLine}}.
\(            : {token, {'(', TokenLine}}.
\)            : {token, {')', TokenLine}}.
,             : {token, {',', TokenLine}}.
{WHITESPACE}+ : {token, {whitespace, TokenLine}}.
.             : {token, {junk, TokenLine}}.

Erlang code.
