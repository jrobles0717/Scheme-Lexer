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

Datumn={Boolean}|{Number}|{Character}|{String}|{Symbol}|{List}|{Vector}

Boolean=#t|#f

Number={Num2}|{Num8}|{Num10}|{Num16}

Character=#\{InputCharacter}|{Whitespace}

/* String="{StringCharacter}*" */




%%
{Subsequent} {
  System.out.printf("*** found match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}
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
