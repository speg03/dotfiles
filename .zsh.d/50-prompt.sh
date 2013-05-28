# ┌(23:59:59) user@hostname [~/path]
# └>$ 

p1mark='┌'
p2mark='└'
PROMPT=$'$p1mark%{$fg[cyan]%}(%*)%{$reset_color%} %{$fg[green]%}%n@%m%{$reset_color%} %{$fg[yellow]%}[%2~]%{$reset_color%}\n$p2mark>%(!|%{$fg[red]%}#%{$reset_color%}|$) '
