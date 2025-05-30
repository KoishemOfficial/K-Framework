# Runs on /reload or on world connection

function kf_inputs:load

function kf_timers:delete {node:t1}
function kf_timers:create {node:t1,t:0,h:0,m:0,s:0,end_h:0,end_m:0,end_s:0,end_t:3,single:1,command:"say hi"}