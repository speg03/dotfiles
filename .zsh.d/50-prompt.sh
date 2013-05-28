# ┌>(23:59:59) user@hostname [~/path]
# $ 

p1mark='┌>'
p2mark=''
PROMPT=$'$p1mark%F$fg[cyan](%*)%f %F$fg[green]%n@%m%f %F$fg[yellow][%2~]%f\n$p2mark%(!|%F%{$fg[red]%}#%f|$) '
