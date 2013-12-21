# A shortcut function that simplifies usage of xclip in Fish Shell.
# It accepts input from either stdin (pipe), or params.
#
# See also companion functions available on the project webpage.
#
# This is a version for Fish Shell adapted from a Bash version by Nathan Broadbent:
# http://madebynathan.com/2011/10/04/a-nicer-way-to-use-xclip/
#
# Version: 0.5.0
# Author: Marcin Zajączkowski <mszpak ATT wp DOTT pl>
# Website: https://github.com/szpak/fish-xclip-enhancer
#
function cb -d "A shortcut function that simplifies usage of xclip"

  set -l cInfo (set_color green)
  set -l cWarn (set_color red)
  set -l cReset (set_color $fish_color_normal)

  #Check that xclip is installed
  if not type xclip > /dev/null
    echo -e $cWarn"You must have the 'xclip' program installed."$cReset
  #Check user is not root (root doesn't have access to user xorg server)
  else if [ "$USER" = "root" ]
    echo -e $cWarn"Must be regular user (not root) to copy a file to the clipboard."$cReset
  else
    #If no tty, data should be available on stdin
    if not tty >/dev/null
      while read i; set input "$input""$i"\n; end
    #Else, fetch input from params
    else
      set input $argv
    end

    #If no input, print usage message
    if [ -z "$input" ]
      echo "Copies a string to the clipboard."
      echo "Usage: cb <string>"
      echo "       echo <string> | cb"
    else
      #Copy input to clipboard
      echo -n $input | xclip -selection clipboard
      #Keep status text in one line
      set input (echo -e "$input" | tr '\n' ' ')
      #Truncate text for status if too long
      if [ (expr length "$input") -gt 80 ]
	set input (echo -e "$input" | head -c 80)$cInfo"..."$cReset
      end
      #Print status
      echo -ne $cInfo"Copied to clipboard: "$cReset"$input"
    end
  end
end

