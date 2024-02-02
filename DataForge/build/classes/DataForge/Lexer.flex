package DataForge;
import static DataForge.Tokens.*;

%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t\r\n]+

%{
    public String lexeme;
%}

%%

int |
program |
end |
var |
double|
char|
arr|
sum|
res|
mul|
div|
mod|
media|
mediana|
moda|
varianza|
min|
max|
console|
print|
column|
exec|
graphbar|
titulo|
ejex|
ejey|
titulox|
tituloy|
graphpie|
label|
values|
graphline|
histogram|
::|
if |
else |
while {lexeme=yytext(); return Reservadas;}

"=" {lexeme=yytext(); return Igual;}
"[" {lexeme=yytext(); return Corchete_izq;}
"]" {lexeme=yytext(); return Corchete_der;}
"(" {lexeme=yytext(); return Parentesis_izq;}
")" {lexeme=yytext(); return Parentesis_der;}
"+" {lexeme=yytext(); return Suma;}
"-" {lexeme=yytext(); return Resta;}
"*" {lexeme=yytext(); return Multiplicacion;}
"/" {lexeme=yytext(); return Division;}
";" {lexeme=yytext(); return Punto_coma;}
":" {lexeme=yytext(); return Dos_puntos;}
"." {lexeme=yytext(); return Punto;}
"," {lexeme=yytext(); return Coma;}
"“" {lexeme=yytext(); return Comilla_doble_izq;}
"”" {lexeme=yytext(); return Comilla_doble_der;}
"<-" {lexeme=yytext(); return Reservadas;}
"@" {lexeme=yytext(); return Arroba;}
{espacio} {/*Ignore*/}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
. {lexeme=yytext(); return ERROR;}


