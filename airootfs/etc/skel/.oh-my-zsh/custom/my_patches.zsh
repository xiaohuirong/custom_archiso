# https://www.reddit.com/r/zsh/comments/hextyh/zshautosuggestions_use_arrow_left_for_partial/
# Remove forward-char widgets from ACCEPT
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char}")
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#vi-forward-char}")

# Add forward-char widgets to PARTIAL_ACCEPT
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(vi-forward-char)

# Add custom widget to complete partial if cursor is at end of buffer
autosuggest_partial_wordwise () {   
if [[ $CURSOR -lt ${#BUFFER} && $KEYMAP != vicmd ||
      $CURSOR -lt $((${#BUFFER} - 1)) ]]; then
  zle forward-char
else
  zle forward-word
fi
}
zle -N autosuggest_partial_wordwise 
bindkey "${terminfo[kcuf1]}" autosuggest_partial_wordwise

# Add autosuggest_partial_wordwise to IGNORE
ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=(autosuggest_partial_wordwise)

