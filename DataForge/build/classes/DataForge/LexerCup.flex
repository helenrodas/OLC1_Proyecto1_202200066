package DataForge;
import java_cup.runtime.Symbol;

%%
%class LexerCup
%type java_cup.runtime.Symbol
%public
%cup
%column
%line
%char
%ignorecase
L=[a-zA-Z_]+
D=[0-9]+
NUMERO = {D}+("."{D}+)?

espacio=[ \t\r\n]+
ESPACIO=[ ]

COMILLA = "\""

%{
    
%}
%init{
    yyline = 1;
    yycolumn = 1;
%init}


Char_General = [^\"]
%%

program {System.out.println("--<Program: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Program, yycolumn, yyline, yytext());}
end     {System.out.println("--<End: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.End, yycolumn, yyline, yytext());}
var     {System.out.println("--<Variable: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Variable, yycolumn, yyline, yytext());}
double  {System.out.println("--<Var_Tipo: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Var_Tipo, yycolumn, yyline, yytext());}
char\[\] {System.out.println("--<Var_Tipo: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Var_Tipo, yycolumn, yyline, yytext());}
arr     {System.out.println("--<Array: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Array, yycolumn, yyline, yytext());}
sum     {System.out.println("--<Fun_Arit: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Arit, yycolumn, yyline, yytext());}
res     {System.out.println("--<Fun_Arit: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Arit, yycolumn, yyline, yytext());}
mul     {System.out.println("--<Fun_Arit: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Arit, yycolumn, yyline, yytext());}
div     {System.out.println("--<Fun_Arit: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Arit, yycolumn, yyline, yytext());}
mod     {System.out.println("--<Fun_Arit: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Arit, yycolumn, yyline, yytext());}
media   {System.out.println("--<Fun_Esta: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Esta, yycolumn, yyline, yytext());}
mediana {System.out.println("--<Fun_Esta: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Esta, yycolumn, yyline, yytext());}
moda    {System.out.println("--<Fun_Esta: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Esta, yycolumn, yyline, yytext());}
varianza {System.out.println("--<Fun_Esta: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Esta, yycolumn, yyline, yytext());}
min     {System.out.println("--<Fun_Esta: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Esta, yycolumn, yyline, yytext());}
max     {System.out.println("--<Fun_Esta: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Esta, yycolumn, yyline, yytext());}
console {System.out.println("--<Fun_Consola: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Consola, yycolumn, yyline, yytext());}
print   {System.out.println("--<Imprimir: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Imprimir, yycolumn, yyline, yytext());}
column  {System.out.println("--<Columna: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Columna, yycolumn, yyline, yytext());}
exec    {System.out.println("--<Ejecutar: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Ejecutar, yycolumn, yyline, yytext());}
graphbar {System.out.println("--<Tipo_Grafica: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Tipo_Grafica, yycolumn, yyline, yytext());}
titulo  {System.out.println("--<Titulo: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Titulo, yycolumn, yyline, yytext());}
ejex    {System.out.println("--<Eje_X: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Eje_X, yycolumn, yyline, yytext());}
ejey    {System.out.println("--<Eje_Y: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Eje_Y, yycolumn, yyline, yytext());}
titulox {System.out.println("--<Titulo_X: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Titulo_X, yycolumn, yyline, yytext());}
tituloy {System.out.println("--<Titulo_Y: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Titulo_Y, yycolumn, yyline, yytext());}
graphpie {System.out.println("--<Tipo_Grafica: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Tipo_Grafica, yycolumn, yyline, yytext());}
label   {System.out.println("--<Grafica_Label: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Grafica_Label, yycolumn, yyline, yytext());}
values  {System.out.println("--<Grafica_Valores: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Grafica_Valores, yycolumn, yyline, yytext());}
graphline {System.out.println("--<Tipo_Grafica: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Tipo_Grafica, yycolumn, yyline, yytext());}
histogram {System.out.println("--<Tipo_Grafica: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Tipo_Grafica, yycolumn, yyline, yytext());}

"=" {System.out.println("--<Signo_Igual: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Signo_Igual, yycolumn, yyline, yytext());}
"::" {System.out.println("--<DosPuntos_Dobles: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.DosPuntos_Dobles, yycolumn, yyline, yytext());}
"[" {System.out.println("--<Corchete_Izq: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Corchete_Izq, yycolumn, yyline, yytext());}
"]" {System.out.println("--<Corchete_Der: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Corchete_Der, yycolumn, yyline, yytext());}
"(" {System.out.println("--<Parentesis_Izq: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Parentesis_Izq, yycolumn, yyline, yytext());}
")" {System.out.println("--<Parentesis_Der: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Parentesis_Der, yycolumn, yyline, yytext());}
"+" {System.out.println("--<Signo_Suma: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Signo_Suma, yycolumn, yyline, yytext());}
"-" {System.out.println("--<Signo_Resta: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Signo_Resta, yycolumn, yyline, yytext());}
"*" {System.out.println("--<Signo_Multiplicacion: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Signo_Multiplicacion, yycolumn, yyline, yytext());}
"/" {System.out.println("--<Signo_Division: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Signo_Division, yycolumn, yyline, yytext());}
";" {System.out.println("--<Punto_Coma: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Punto_Coma, yycolumn, yyline, yytext());}
":" {System.out.println("--<Dos_Puntos: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Dos_Puntos, yycolumn, yyline, yytext());}
"." {System.out.println("--<Punto: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Punto, yycolumn, yyline, yytext());}
"," {System.out.println("--<Coma: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Coma, yycolumn, yyline, yytext());}
"<-" {System.out.println("--<Signo_Indicador: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Signo_Indicador, yycolumn, yyline, yytext());}
"->" {System.out.println("--<Signo_IndicadorR: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Signo_IndicadorR, yycolumn, yyline, yytext());}

"@" {System.out.println("--<Signo_Arroba: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Signo_Arroba, yycolumn, yyline, yytext());}
{espacio} {/*Ignore*/}
{L}({L}|{D})* {System.out.println("--<Identificador: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Identificador, yycolumn, yyline, yytext());}
{NUMERO} {System.out.println("--<Numero: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Numero, yycolumn, yyline, yytext());}
"\""({L}|{D}|{ESPACIO}|{NUMERO}|[-]|[:])*"\"" {System.out.println("--<Char_General: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Char_General, yycolumn, yyline, yytext());}
. {return new Symbol(sym.ERROR, yycolumn, yyline, yytext());}

