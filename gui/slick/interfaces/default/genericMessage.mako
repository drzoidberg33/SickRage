<%!
    import sickbeard

    global title=""
    global sbPath="../.."
    global topmenu="home"#

    import os.path
    include os.path.join(sickbeard.PROG_DIR, "gui/slick/interfaces/default/inc_top.tmpl")
%>
<h2>${subject}</h2>
${message}

% include os.path.join(sickbeard.PROG_DIR, "gui/slick/interfaces/default/inc_bottom.tmpl")