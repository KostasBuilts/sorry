{to be continued}

program exString;
var
   usrin: packed array [1..3] of char;

begin
   
   writeln('Did I eat your souvlaki (y/n):');
   readln(usrin);
   if (usrin == 'yes') then
    writeln('hello')