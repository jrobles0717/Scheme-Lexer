%%
%class lexer
%standalone
%line
%column

LineTerminator=\r|\n|\r\n
InputCharacter =[^\r\n]
Whitespace={LineTerminator}|[\s\t\f]
Comment=;*{InputCharacter}*{LineTerminator}




Program ={form}*

Form={Definition}|{Expression}

Definition={VariableDefinition}|{SyntaxDefinition}|"("{Definition}*")"|"(""("{SyntaxBinding}*")"{Definition}*")"|{DerivedDefinition}

VariableDefinition="("{Variable}{Expression}")"|"(""("{Variable}{Variable}*")"{Body}")"|"("({Variable}{Variable}*"."{Variable}){Body}")"

Variable={Identifier}

Body={Definition}*{Expression}+

SyntaxDefinition= "("{Keyword}{TransformerExpression}")"

Keyword={Identifier}

SyntaxBinding="("{Keyword}{TransformerExpression}")"

Expression={Constant}|{Variable}|"("{Datum}")"|'{Datum}|"("{Formals}{Body}")"|"("{Expression}{Expression}{Expression}")"|"("{Expression}{Expression}")"|"("{Variable}{Expression}")"|{Application}|"(""("{SyntaxBinding}*")"{Expression}+")"|{DerivedExpression}

Constant={Boolean}|{Number}|{Character}|{String}

Formals={Variable}|"("{Variable}*")"|"("{Variable}+"."{Variable}")"

Application="("{Expression}{Expression}*")"

Identifier={Initial}{Subsequent}*|"+"|"-"|...

Initial={Letter}|"!"|"$"|%|"&"|"*"|"/"|":"|"<"|">"|"?"|"~"|"_"|"^"

Subsequent={Initial}|{Digit}|"."|"+"|"-"

Letter=[a-zA-z0]

Digit=[0-9]

Datum={Boolean}|{Number}|{Character}|{String}|{Symbol}|{List}|{Vector}

Boolean=#t|#f

Number={Num2}|{Num8}|{Num10}|{Num16}

Character=#\|{Whitespace}|\n

 String=\"(([^\"]|\\\")*[^\\])?\"

Symbol={Identifier}

List="("{Datum}*")"|"("{Datum}+"."{Datum}")"|{Abbreviation}

Abbreviation=\'{Datum}\'{Datum}|,{Datum}|,@{Datum}

Vector=#"("{Datum}*")"




/*
Base 2
*/

Num2={Prefix2}{Complex2}

Complex2={Real2}|{Real2}@{Real2}|{Real2}+{Image2}|{Real2}"-"{Image2}|"+"{Image2}|"-"{Image2}

Image2=i|{UReal2}i

Real2={Sign}{UReal2}

UReal2={UInteger2}|{UInteger2}/{UInteger2}|{Decimal2}

UInteger2={Digit2}+#*

Prefix2={Radix2}{Exactness}{Exactness}{Radix2}
/*
Base 8
*/

Num8={Prefix8}{Complex8}

Complex8={Real8}|{Real8}@{Real8}|{Real8}+{Image8}|{Real8}"-"{Image8}|"+"{Image8}|"-"{Image8}

Image8=i|{UReal8}i

Real8={Sign}{UReal8}

UReal8={UInteger8}|{UInteger8}/{UInteger8}|{Decimal8}

UInteger8={Digit8}+#*

Prefix8={Radix8}{Exactness}{Exactness}{Radix8}



/*
Base 10
*/

Num10={Prefix10}{Complex10}

Complex10={Real10}|{Real10}@{Real10}|{Real10}+{Image10}|{Real10}"-"{Image10}|"+"{Image10}|"-"{Image10}

Image10=i|{UReal10}i

Real10={Sign}{UReal10}

UReal10={UInteger10}|{UInteger10}/{UInteger10}|{Decimal10}

UInteger10={Digit10}+#*

Prefix10={Radix10}{Exactness}{Exactness}{Radix10}

Decimal10={UInteger10}{Exponent}|"."{Digit10}+#*{Suffix}|{Digit10}+"."{Digit10}*#*{Suffix}|{Digit10}+#+}"."#*{Suffix}|{Digit10}+#+"."#*{Suffix}


/*
Base 16
*/

Num16={Prefix16}{Complex16}

Complex16={Real16}|{Real16}@{Real16}|{Real16}+{Image16}|{Real16}"-"{Image16}|"+"{Image16}|"-"{Image16}
Image16=i|{UReal16}i


Real16={Sign}{UReal16}

UReal16={UInteger16}|{UInteger16}/{UInteger16}|{Decimal16}

UInteger16={Digit16}+#*

Prefix16={Radix16}{Exactness}{Exactness}{Radix16}



/*Final Definition*/
Suffix={Empty}|{Exponent}

Exponent={ExponentMarker}{Sign}{Digit10}+

ExponentMarker=e|e|f|d|l

Sign={Empty}|"+"|"-"

Exactness={Empty}|#i|#e

Radix2=#b

Radix8=#o

Radix10=[Empty]|#d

Radix16=#x

Digit2=0|1

Digit8=[0-7]

Digit10={Digit}

Digit16={Digit}[a-f]









%%

/* {String} {
  System.out.printf("*** found match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
} */

/* {Subsequent} {
  System.out.printf("*** found match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
} */
/* {Boolean} {
  System.out.printf("*** found match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
} */

/* {Comment} {
  System.out.printf("*** found match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
} */

/* {Character} {
  System.out.printf("*** found match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
} */

. {/* Do nothing*/}
