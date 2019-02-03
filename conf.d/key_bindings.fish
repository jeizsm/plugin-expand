if status --is-interactive
  # Bind word expansion (and command completion) to the Tab key.
  bind --sets-mode expand \t expand:execute

  # During expansion, bind Backspace to revert the operation.
  bind --mode expand --sets-mode default --key backspace expand:revert

  # Bind Tab to cycle through the available expansions.
  bind --mode expand \t expand:choose-next

  # If the user enters any key other than Backspace, exit expand mode and passthrough keys to the default binding.
  bind --mode expand --sets-mode default '' ''
end

set -l name (basename (status -f) .fish){_uninstall}

function $name -e $name
    echo $name
    bind --mode expand --erase --all
    bind \t --erase
end
