<%!
    import sickbeard
    import datetime
    from sickbeard.common import *
    global title="Manage Torrents"
    global header="Manage Torrents"
    global sbPath=".."

    global topmenu="manage"#
    import os.path
    include file=os.path.join(sickbeard.PROG_DIR, "gui/slick/interfaces/default/inc_top.mako")
%>

<script type="text/javascript" src="${sbRoot}/js/plotTooltip.js?${sbPID}"></script>
    % if not header is UNDEFINED:
        <h1 class="header">${header}</h1>
    % else
        <h1 class="title">${title}</h1>
    % endif

${info_download_station}
<iframe id="extFrame" src="${webui_url}" width="100%" height="500" frameBorder="0" style="border: 1px black solid;"></iframe>

% include file=os.path.join(sickbeard.PROG_DIR, "gui/slick/interfaces/default/inc_bottom.mako")