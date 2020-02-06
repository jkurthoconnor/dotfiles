#!/bin/bash

desktop=^sull
laptop=^kel

if [[ $HOSTNAME =~ $desktop ]] || [[ $HOSTNAME =~ $laptop ]]; then
  i3-msg "exec --no-startup-id /usr/bin/dropbox start -i"
fi
