# Runs on /reload or on world connection

function kf_inputs:load

function kf_dialogue:delete {node:d1}
function kf_dialogue:delete {node:d2}
function kf_dialogue:create {node:d1,text:" Привет Мир! Привет Мир!",author:{text:"[Koishem]",color:white},step:3,selector:"@a",display:{color:blue,italic:true},command:"playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 999",delay:3}
function kf_dialogue:create {node:d2,text:" Hello World!",author:{text:"[Koishem]",color:red,bold:true},step:1,selector:"@a",display:{color:green,italic:true,bold:false,text:""},command:"say Я запускаю команду от каждого вывода символов!",delay:1}