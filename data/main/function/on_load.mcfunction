# Runs on /reload or on world connection

function kf_inputs:load

function kf_timers:delete {node:t1}
function kf_timers:create {node:t1,h:0,m:0,s:57,end_h:0,end_m:1,end_s:0,single:1,command:"say hi"}