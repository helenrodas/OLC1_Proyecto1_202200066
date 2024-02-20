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
DECIMAL = {D}\.{D} 
espacio=[ \t\r\n]+

%{
    
%}
%init{
    yyline = 1;
    yycolumn = 1;
%init}
%%

program {System.out.println("--<Program: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Program_Inicio, yycolumn, yyline, yytext());}
end     {System.out.println("--<End: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.End, yycolumn, yyline, yytext());}
var     {System.out.println("--<Variable: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Variable, yycolumn, yyline, yytext());}
double  {System.out.println("--<Fun_Double: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Double, yycolumn, yyline, yytext());}
char    {System.out.println("--<Fun_Char: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Char, yycolumn, yyline, yytext());}
arr     {System.out.println("--<Array: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Array, yycolumn, yyline, yytext());}
sum     {System.out.println("--<Fun_Suma: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Suma, yycolumn, yyline, yytext());}
res     {System.out.println("--<Fun_Resta: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Resta, yycolumn, yyline, yytext());}
mul     {System.out.println("--<Fun_Multiplicacion: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Multiplicacion, yycolumn, yyline, yytext());}
div     {System.out.println("--<Fun_Division: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Division, yycolumn, yyline, yytext());}
mod     {System.out.println("--<Fun_Mod: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Mod, yycolumn, yyline, yytext());}
media   {System.out.println("--<Fun_Media: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Media, yycolumn, yyline, yytext());}
mediana {System.out.println("--<Fun_Mediana: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Mediana, yycolumn, yyline, yytext());}
moda    {System.out.println("--<Fun_Moda: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Moda, yycolumn, yyline, yytext());}
varianza {System.out.println("--<Fun_Varianza: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Varianza, yycolumn, yyline, yytext());}
min     {System.out.println("--<Fun_Minimo: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Minimo, yycolumn, yyline, yytext());}
max     {System.out.println("--<Fun_Maximo: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Maximo, yycolumn, yyline, yytext());}
console {System.out.println("--<Fun_Consola: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Fun_Consola, yycolumn, yyline, yytext());}
print   {System.out.println("--<Imprimir: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Imprimir, yycolumn, yyline, yytext());}
column  {System.out.println("--<Columna: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Columna, yycolumn, yyline, yytext());}
exec    {System.out.println("--<Ejecutar: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Ejecutar, yycolumn, yyline, yytext());}
graphbar {System.out.println("--<Grafica_Barras: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Grafica_Barras, yycolumn, yyline, yytext());}
titulo  {System.out.println("--<Grafica_Titulo: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Grafica_Titulo, yycolumn, yyline, yytext());}
ejex    {System.out.println("--<Eje_X: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Eje_X, yycolumn, yyline, yytext());}
ejey    {System.out.println("--<Eje_Y: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Eje_Y, yycolumn, yyline, yytext());}
titulox {System.out.println("--<Titulo_X: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Titulo_X, yycolumn, yyline, yytext());}
tituloy {System.out.println("--<Titulo_Y: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Titulo_Y, yycolumn, yyline, yytext());}
graphpie {System.out.println("--<Grafica_Pie: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Grafica_Pie, yycolumn, yyline, yytext());}
label   {System.out.println("--<Grafica_Label: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Grafica_Label, yycolumn, yyline, yytext());}
values  {System.out.println("--<Grafica_Valores: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Grafica_Valores, yycolumn, yyline, yytext());}
graphline {System.out.println("--<Grafica_Lineal: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Grafica_Lineal, yycolumn, yyline, yytext());}
histogram {System.out.println("--<Grafica_Histograma: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Grafica_Histograma, yycolumn, yyline, yytext());}

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
"“" {System.out.println("--<DobleComilla_Izq: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.DobleComilla_Izq, yycolumn, yyline, yytext());}
"”" {System.out.println("--<DobleComilla_Der: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.DobleComilla_Der, yycolumn, yyline, yytext());}
"<-" {System.out.println("--<Signo_Indicador: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Signo_Indicador, yycolumn, yyline, yytext());}
"@" {System.out.println("--<Signo_Arroba: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Signo_Arroba, yycolumn, yyline, yytext());}
{espacio} {/*Ignore*/}
{L}({L}|{D})* {System.out.println("--<Identificador: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Identificador, yycolumn, yyline, yytext());}
{D} {System.out.println("--<Numero: " +yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">");return new Symbol(sym.Numero, yycolumn, yyline, yytext());}
{D}+("."{D}+)? { System.out.println("--<Decimal: " + yytext() + " || linea: "+ yyline + " ||columna: "+ yycolumn+">"); return new Symbol(sym.Decimal, yycolumn, yyline, yytext());}
. {return new Symbol(sym.ERROR, yycolumn, yyline, yytext());}

