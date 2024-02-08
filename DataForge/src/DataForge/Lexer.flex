package DataForge;
import static DataForge.Tokens.*;

%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[\r]+

%{
    public String lexeme;
%}

%%

program {lexeme=yytext(); return Program_Inicio;}
end     {lexeme=yytext(); return End;}
var     {lexeme=yytext(); return Variable;}
double  {lexeme=yytext(); return Fun_Double;}
char    {lexeme=yytext(); return Fun_Char;}
arr     {lexeme=yytext(); return Array;}
sum     {lexeme=yytext(); return Fun_Suma;}
res     {lexeme=yytext(); return Fun_Resta;}
mul     {lexeme=yytext(); return Fun_Multiplicacion;}
div     {lexeme=yytext(); return Fun_Division;}
mod     {lexeme=yytext(); return Fun_Mod;}
media   {lexeme=yytext(); return Fun_Media;}
mediana {lexeme=yytext(); return Fun_Mediana;}
moda    {lexeme=yytext(); return Fun_Moda;}
varianza {lexeme=yytext(); return Fun_Varianza;}
min     {lexeme=yytext(); return Fun_Minimo;}
max     {lexeme=yytext(); return Fun_Maximo;}
console {lexeme=yytext(); return Consola;}
print   {lexeme=yytext(); return Imprimir;}
column  {lexeme=yytext(); return Columna;}
exec    {lexeme=yytext(); return Ejecutar;}
graphbar {lexeme=yytext(); return Grafica_Barras;}
titulo  {lexeme=yytext(); return Grafica_Titulo;}
ejex    {lexeme=yytext(); return Eje_X;}
ejey    {lexeme=yytext(); return Eje_Y;}
titulox {lexeme=yytext(); return Titulo_X;}
tituloy {lexeme=yytext(); return Titulo_Y;}
graphpie {lexeme=yytext(); return Grafica_Pie;}
label   {lexeme=yytext(); return Grafica_Label;}
values  {lexeme=yytext(); return Grafica_Valores;}
graphline {lexeme=yytext(); return Grafica_Lineal;}
histogram {lexeme=yytext(); return Grafica_Histograma;}

"=" {lexeme=yytext(); return Signo_Igual;}
"\n" {return Linea;}
"::" {lexeme=yytext(); return DosPuntos_Dobles;}
"[" {lexeme=yytext(); return Corchete_Izq;}
"]" {lexeme=yytext(); return Corchete_Der;}
"(" {lexeme=yytext(); return Parentesis_Izq;}
")" {lexeme=yytext(); return Parentesis_Der;}
"+" {lexeme=yytext(); return Signo_Suma;}
"-" {lexeme=yytext(); return Signo_Resta;}
"*" {lexeme=yytext(); return Signo_Multiplicacion;}
"/" {lexeme=yytext(); return Signo_Division;}
";" {lexeme=yytext(); return Punto_Coma;}
":" {lexeme=yytext(); return Dos_Puntos;}
"." {lexeme=yytext(); return Punto;}
"," {lexeme=yytext(); return Coma;}
"“" {lexeme=yytext(); return DobleComilla_Izq;}
"”" {lexeme=yytext(); return DobleComilla_Der;}
"<-" {lexeme=yytext(); return Signo_Indicador;}
"@" {lexeme=yytext(); return Signo_Arroba;}
" " {return Espacio;}
"\t" {return Tab;}
{espacio} {/*Ignore*/}



{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
{D}+("."{D}+)? {lexeme=yytext(); return Numero;}


. {lexeme=yytext(); return ERROR;}


