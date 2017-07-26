grammar Lefty;

lefty
	:	something
	|	lefty something
	;

something
	:	Identifier
	;

Identifier
	:	[A-Z]+
	;

Whitespace
	:	[ \t]+
		-> skip
	;

Newline
	:	(   '\r' '\n'?
		|   '\n'
		)
		-> skip
	;
