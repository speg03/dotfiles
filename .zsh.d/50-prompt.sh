# ┌>(23:59:59) user@hostname [~/path]
# $ 

p1mark='┌>'
p2mark=''
PROMPT=$'$p1mark%F{cyan}(%*)%f %F{green}%n@%m%f %F{yellow}[%2~]%f\n$p2mark%(!|%F{red}#%f|$) '
