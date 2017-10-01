myrule:
		statement
	|	type name ASSIGN (number | STRING)
	|	if
	|	loop
	|	print STRING COMMA (STRING|number)*
;

// wanted ecore model:
myrule:
		statement=statement
	|	type=type name=name assign=ASSIGN (number=number | string=STRING)
	|	if=if
	|	loop=loop
	|	print=STRING comma=COMMA myrule_interal_group_1*

myrule_interal_group_1:
		string=STRING
	|	number=number
