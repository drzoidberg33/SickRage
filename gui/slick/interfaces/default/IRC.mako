<%
    import sickbeard
    from sickbeard.common import *

    import os.path
    include $os.path.join($sickbeard.PROG_DIR, "gui/slick/interfaces/default/inc_top.tmpl")

    if sickbeard.GIT_USERNAME
        username = sickbeard.GIT_USERNAME
    else
        username = "SickRageUI|?"
    endif
%>

<iframe id="extFrame" src="https://kiwiirc.com/client/irc.freenode.net/?nick=${username}&theme=basic#sickrage" width="100%" height="500" frameBorder="0" style="border: 1px black solid;"></iframe>

% include $os.path.join(sickbeard.PROG_DIR, "gui/slick/interfaces/default/inc_bottom.tmpl")