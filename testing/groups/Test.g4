grammar Test;

test:
	declaration
;

declaration:
	type Identifier
	(
		Comma type Identifier
	)*
	Semi
;

type:
		Kw_int
	|	Kw_void
;

Comma: ',';
Semi: ';';

Kw_int: 'int';
Kw_void: 'void';

Identifier
	:	[A-Za-z]+
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
