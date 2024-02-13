package DataForge;
import java_cup.runtime.Symbol;

%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
%ignorecase
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t\r\n]+

%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}

%%

program {return new Symbol(sym.Program_Inicio, yychar, yyline, yytext());}
end     {return new Symbol(sym.End, yychar, yyline, yytext());}
var     {return new Symbol(sym.Variable, yychar, yyline, yytext());}
double  {return new Symbol(sym.Fun_Double, yychar, yyline, yytext());}
char    {return new Symbol(sym.Fun_Char, yychar, yyline, yytext());}
arr     {return new Symbol(sym.Array, yychar, yyline, yytext());}
sum     {return new Symbol(sym.Fun_Suma, yychar, yyline, yytext());}
res     {return new Symbol(sym.Fun_Resta, yychar, yyline, yytext());}
mul     {return new Symbol(sym.Fun_Multiplicacion, yychar, yyline, yytext());}
div     {return new Symbol(sym.Fun_Division, yychar, yyline, yytext());}
mod     {return new Symbol(sym.Fun_Mod, yychar, yyline, yytext());}
media   {return new Symbol(sym.Fun_Media, yychar, yyline, yytext());}
mediana {return new Symbol(sym.Fun_Mediana, yychar, yyline, yytext());}
moda    {return new Symbol(sym.Fun_Moda, yychar, yyline, yytext());}
varianza {return new Symbol(sym.Fun_Varianza, yychar, yyline, yytext());}
min     {return new Symbol(sym.Fun_Minimo, yychar, yyline, yytext());}
max     {return new Symbol(sym.Fun_Maximo, yychar, yyline, yytext());}
console {return new Symbol(sym.Fun_Consola, yychar, yyline, yytext());}
print   {return new Symbol(sym.Imprimir, yychar, yyline, yytext());}
column  {return new Symbol(sym.Columna, yychar, yyline, yytext());}
exec    {return new Symbol(sym.Ejecutar, yychar, yyline, yytext());}
graphbar {return new Symbol(sym.Grafica_Barras, yychar, yyline, yytext());}
titulo  {return new Symbol(sym.Grafica_Titulo, yychar, yyline, yytext());}
ejex    {return new Symbol(sym.Eje_X, yychar, yyline, yytext());}
ejey    {return new Symbol(sym.Eje_Y, yychar, yyline, yytext());}
titulox {return new Symbol(sym.Titulo_X, yychar, yyline, yytext());}
tituloy {return new Symbol(sym.Titulo_Y, yychar, yyline, yytext());}
graphpie {return new Symbol(sym.Grafica_Pie, yychar, yyline, yytext());}
label   {return new Symbol(sym.Grafica_Label, yychar, yyline, yytext());}
values  {return new Symbol(sym.Grafica_Valores, yychar, yyline, yytext());}
graphline {return new Symbol(sym.Grafica_Lineal, yychar, yyline, yytext());}
histogram {return new Symbol(sym.Grafica_Histograma, yychar, yyline, yytext());}

"=" {return new Symbol(sym.Signo_Igual, yychar, yyline, yytext());}
"::" {return new Symbol(sym.DosPuntos_Dobles, yychar, yyline, yytext());}
"[" {return new Symbol(sym.Corchete_Izq, yychar, yyline, yytext());}
"]" {return new Symbol(sym.Corchete_Der, yychar, yyline, yytext());}
"(" {return new Symbol(sym.Parentesis_Izq, yychar, yyline, yytext());}
")" {return new Symbol(sym.Parentesis_Der, yychar, yyline, yytext());}
"+" {return new Symbol(sym.Signo_Suma, yychar, yyline, yytext());}
"-" {return new Symbol(sym.Signo_Resta, yychar, yyline, yytext());}
"*" {return new Symbol(sym.Signo_Multiplicacion, yychar, yyline, yytext());}
"/" {return new Symbol(sym.Signo_Division, yychar, yyline, yytext());}
";" {return new Symbol(sym.Punto_Coma, yychar, yyline, yytext());}
":" {return new Symbol(sym.Dos_Puntos, yychar, yyline, yytext());}
"." {return new Symbol(sym.Punto, yychar, yyline, yytext());}
"," {return new Symbol(sym.Coma, yychar, yyline, yytext());}
"“" {return new Symbol(sym.DobleComilla_Izq, yychar, yyline, yytext());}
"”" {return new Symbol(sym.DobleComilla_Der, yychar, yyline, yytext());}
"<-" {return new Symbol(sym.Signo_Indicador, yychar, yyline, yytext());}
"@" {return new Symbol(sym.Signo_Arroba, yychar, yyline, yytext());}
{espacio} {/*Ignore*/}
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}
{D}+("."{D}+)? {return new Symbol(sym.Numero, yychar, yyline, yytext());}
. {return new Symbol(sym.ERROR, yychar, yyline, yytext());}

