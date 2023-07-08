
# name: MY FISH SHELL

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
  set -l magenta (set_color -o magenta)
  set -l cwd $magenta(pwd | sed "s:^$HOME:~:")
  set_color -o red
  printf '┌─﹝'
  set_color -o blue
  #printf '%s ' (whoami)
  #set_color $fish_color_autosuggestion[1]
  #set_color -o blue
  #printf '∰ '
  set_color cyan
  printf '%s ' (hostname|cut -d . -f 1)
  #set_color $fish_color_autosuggestion[1]
  set_color -o blue
  printf '⬌ '
  set_color -o green
  echo -n -s $cwd $normal
  set_color -o red
  printf '﹞'

  echo
  set_color -o red
  printf '└─<'
  set_color yellow
  printf '%s' (__fish_git_prompt)
  if [ (_is_git_dirty) ]
    set_color blue
    printf '* '
  end
  set_color -o red
  printf '>'
  set_color yellow
  printf '⋙  '
  set_color normal
end
