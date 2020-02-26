%%
%class lexer
%standalone
%line
%column

whitespace = [\t\n]+
%%
(a|b)*abb {
  System.out.printf("*** found match [%s] at line %d, column %d\n",yytext(),yyline,yycolumn);
}
{whitespace} {System.out.println("whitespace!")}
. {/* Do nothing*/}
