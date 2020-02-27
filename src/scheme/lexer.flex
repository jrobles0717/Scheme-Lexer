%%
%class lexer
%standalone
%line
%column

LineTerminator=\r|\n|\r\n

InputCharacter =[^\r\n]

Whitespace={LineTerminator}|[\s\t\f]

Comment=;*{InputCharacter}*{LineTerminator}

Empty=[^$]




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


/*** Numbers ***********************************************************************************************************/

/*
Base 2
*/

Num2={Prefix2}{Complex2}

Complex2={Real2}|{Real2}@{Real2}|{Real2}+{Imag2}|{Real2}"-"{Imag2}|"+"{Imag2}|"-"{Imag2}

Imag2=i|{UReal2}i

Real2={Sign}{UReal2}

UReal2={UInteger2}|{UInteger2}"/"{UInteger2}

UInteger2={Digit2}+#*

Prefix2={Radix2}{Exactness}|{Exactness}{Radix2}
/*
Base 8
*/

Num8={Prefix8}{Complex8}

Complex8={Real8}|{Real8}@{Real8}|{Real8}+{Imag8}|{Real8}"-"{Imag8}|"+"{Imag8}|"-"{Imag8}

Imag8=i|{UReal8}i

Real8={Sign}{UReal8}

UReal8={UInteger8}|{UInteger8}"/"{UInteger8}

UInteger8={Digit8}+#*

Prefix8={Radix8}{Exactness}|{Exactness}{Radix8}



/*
Base 10
*/

Num10={Prefix10}{Complex10}

Complex10={Real10}|{Real10}@{Real10}|{Real10}+{Imag10}|{Real10}"-"{Imag10}|"+"{Imag10}|"-"{Imag10}

Imag10=i|{UReal10}i

Real10={Sign}{UReal10}

UReal10={UInteger10}|{UInteger10}"/"{UInteger10}|{Decimal10}

UInteger10={Digit10}+#*

Prefix10={Radix10}{Exactness}|{Exactness}{Radix10}

Decimal10={UInteger10}{Exponent}|"."{Digit10}+#*{Suffix}|{Digit10}+"."{Digit10}*#*{Suffix}|{Digit10}+#+}"."#*{Suffix}|{Digit10}+#+"."#*{Suffix}


/*
Base 16
*/

Num16={Prefix16}{Complex16}

Complex16={Real16}|{Real16}@{Real16}|{Real16}+{Imag16}|{Real16}"-"{Imag16}|"+"{Imag16}|"-"{Imag16}
Imag16=i|{UReal16}i


Real16={Sign}{UReal16}

UReal16={UInteger16}|{UInteger16}"/"{UInteger16}

UInteger16={Digit16}+#*

Prefix16={Radix16}{Exactness}|{Exactness}{Radix16}


Suffix={Empty}|{Exponent}

Exponent={ExponentMarker}{Sign}{Digit10}+

ExponentMarker=e|s|f|d|l

Sign={Empty}|"+"|"-"

Exactness={Empty}|#i|#e

Radix2=#b

Radix8=#o

Radix10={Empty}|#d

Radix16=#x

Digit2=0|1

Digit8=[0-7]

Digit10={Digit}

Digit16={Digit}|[a-f]

%%




/*Tested*/

/*
{Decimal10} {
    System.out.printf("*** found Decimal10 match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}

{Num16} {
    System.out.printf("*** found Num16 match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}

{Complex16} {
    System.out.printf("*** found Complex16 match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}

{Imag16} {
    System.out.printf("*** found Imag16 match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}

{Real16} {
    System.out.printf("*** found Real16 match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}



{UReal16} {
    System.out.printf("*** found UReal16 match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}



{UInteger16} {
    System.out.printf("*** found UInteger16 match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}



 {Prefix16} {
    System.out.printf("*** found Prefix16 match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}


 {Suffix} {
  System.out.printf("*** found Suffix match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}

{Exponent} {
    System.out.printf("*** found Exponent match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}

{ExponentMarker} {
    System.out.printf("*** found ExponentMarker match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}
{Sign} {
    System.out.printf("*** found Sign match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}
{Exactness} {
    System.out.printf("*** found Exactness match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}



{Radix2} {
  System.out.printf("*** found Radix 2 match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}

{Radix8} {
  System.out.printf("*** found Radix 8 match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}


{Radix10} {
  System.out.printf("*** found Radix 10 match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}


{Radix16} {
    System.out.printf("*** found Radix 16 match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}

{Digit16} {
    System.out.printf("*** found Digit 16 match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}

{Digit10} {
    System.out.printf("*** found match Digit 10  [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}

{Digit8} {
    System.out.printf("*** found Digit 8 match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}

{Digit2} {
    System.out.printf("*** found Digit 2 match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}

*/

. {
    System.out.printf("*** found unreadable syntax match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}
