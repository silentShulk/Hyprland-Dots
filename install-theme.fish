#! /bin/fish

for dir in */ .*/
  set dir_name (path basename $dir)
  set first_char (string sub -l 1 $dir_name)

  # Skip current (.) and parent (..) directory entries
  if contains -- $dir_name "." ".."
    continue
  end

  if test $first_char = "."
    cp -r $dir ~/
  else
    cp -r $dir ~/.config/
  end 
end 
