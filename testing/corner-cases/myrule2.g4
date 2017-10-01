myrule2:
		STRING (COMMA (STRING|number))* SEMI
	|	STRING (COMMA (STRING|number))* COLON
	|	STRING (COMMA (STRING|number))+ DOT
;

// wanted ecore model
myrule2:
		string_1=STRING myrule2_internal_group_1+=myrule2_internal_group_1* 
			semi=SEMI
	|	string_2=STRING myrule2_internal_group_2+=myrule2_internal_group_2* 
			colon=COLON
	|	string_3=STRING myrule2_internal_group3+=myrule2_internal_group_3*
;

myrule2_internal_group1:
	COMMA (STRING | number)
;

myrule2_internal_group2:
	COMMA (STRING | number)
;

myrule3_internal_group3:
	COMMA (STRING | number)
;
