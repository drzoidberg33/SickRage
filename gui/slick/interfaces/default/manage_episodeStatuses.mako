<%!
    import sickbeard
    import datetime
    from sickbeard import common
    global title="Episode Overview"
    global header="Episode Overview"

    global sbPath=".."

    global topmenu="manage"#
    import os.path
    include file=os.path.join(sickbeard.PROG_DIR, "gui/slick/interfaces/default/inc_top.mako")
%>
<div id="content960">
% if not header is UNDEFINED:
    <h1 class="header">${header}</h1>
% else
    <h1 class="title">${title}</h1>
% endif

% if not whichStatus or (whichStatus and not ep_counts):

% if whichStatus:
<h2>None of your episodes have status ${common.statusStrings[int(whichStatus)]}</h2>
<br />
% endif

<form action="${sbRoot}/manage/episodeStatuses" method="get">
Manage episodes with status <select name="whichStatus" class="form-control form-control-inline input-sm">
% for curStatus in [common.SKIPPED, common.SNATCHED, common.WANTED, common.ARCHIVED, common.IGNORED]:
<option value="${curStatus}">${common.statusStrings[curStatus]}</option>
% endfor
</select>
<input class="btn btn-inline" type="submit" value="Manage" />
</form>

% else

<script type="text/javascript" src="${sbRoot}/js/manageEpisodeStatuses.js?${sbPID}"></script>

<form action="${sbRoot}/manage/changeEpisodeStatuses" method="post">
<input type="hidden" id="oldStatus" name="oldStatus" value="${whichStatus}" />

<h2>Shows containing ${common.statusStrings[int(whichStatus)]} episodes</h2>

<br />

<%
    if whichStatus in (common.ARCHIVED, common.IGNORED, common.SNATCHED):
        row_class = "good"
    else
        row_class = common.Overview.overviewStrings[whichStatus]
    endif
%>
<input type="hidden" id="row_class" value="${row_class}" />

Set checked shows/episodes to <select name="newStatus" class="form-control form-control-inline input-sm">
<%
    statusList = [common.SKIPPED, common.WANTED, common.ARCHIVED, common.IGNORED]
    if int(whichStatus) in statusList
        statusList.remove(int(whichStatus))
    endif

    if int(whichStatus) in [common.SNATCHED, common.SNATCHED_PROPER]
        statusList.append(common.FAILED)
    endif
%>

% for curStatus in statusList:
<option value="${curStatus}">${common.statusStrings[curStatus]}</option>
% endfor
</select>
<input class="btn btn-inline" type="submit" value="Go" />

<div>
    <button type="button" class="btn btn-xs selectAllShows">Select all</a></button>
    <button type="button" class="btn btn-xs unselectAllShows">Clear all</a></button>
</div>
<br />

<table class="sickbeardTable manageTable" cellspacing="1" border="0" cellpadding="0">
    % for cur_indexer_id in sorted_show_ids:
    <tr id="${cur_indexer_id}">
        <th><input type="checkbox" class="allCheck" id="allCheck-${cur_indexer_id}" name="${cur_indexer_id}-all" checked="checked" /></th>
        <th colspan="2" style="width: 100%; text-align: left;"><a class="whitelink" href="${sbRoot}/home/displayShow?show=${cur_indexer_id}">${show_names[cur_indexer_id]}</a> (${ep_counts[$cur_indexer_id]}) <input type="button" class="pull-right get_more_eps btn" id="${cur_indexer_id}" value="Expand" /></th>
    </tr>
    % endfor
</table>
</form>

% endif
</div>

% include file=os.path.join(sickbeard.PROG_DIR, "gui/slick/interfaces/default/inc_bottom.mako")