grammar Test;

unit:
	line+
;

line:
	a Semi
;

a:
		Kw_public Kw_static
	|	Kw_static Kw_public
;


Semi: ';';

Kw_public: 'public';
Kw_static: 'static';
