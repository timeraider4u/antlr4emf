grammar Test;

unit:
	line+
;

line:
	a Identifier Semi
;

a:
		Kw_public Kw_static
	|	Kw_static Kw_public
;


Semi: ';';

Kw_public: 'public';
Kw_static: 'static';

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
