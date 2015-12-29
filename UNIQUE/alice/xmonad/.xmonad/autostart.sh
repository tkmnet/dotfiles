#!/bin/sh

cd `dirname $0`

ls -a ./autostart/*.sh | xargs -I @ sh -c "sh @ &"
