grammar Test;

unit:
		statement
	|	unit statement
;

statement:	Semi;

Semi: ';';
