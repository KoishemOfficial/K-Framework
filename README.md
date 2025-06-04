# K-Framework v. 1.0 от **Koishem**

![K-Framework Logo](k_framework.png)

**K-Framework** - это набор инструментов, нэймспэйсов и функций которые помогают в разработке карт внутри Minecraft,
делая процесс быстрее и проще, предоставляя готовые решения к определённым задачам.


Этот датапак написан мной - **Koishem**, специально для TF Studios и моих личных целей

Мой дискорд: **koishem**\
Мой телеграм: **@KoishemOff**\
Мой гитхаб: **[Link](https://github.com/KoishemOfficial)**

Сайт TF Studios: **[Website](https://timfilm-studios.github.io/official)**

# Навигация

- [Фрэймворк](#фрэймворк)
- [Диалоги](#диалоги)
- [Сохранения](#сохранения)
- [Инпуты](#инпуты)
- [Таймеры](#таймеры)
- [3Д триггеры](#3д-триггеры)

# Фрэймворк

- [Методы фрэймворка](#методы-фрэймворка)
- [Активация нэймспейсов фрэймворка](#активация-нэймспейсов-фрэймворка)

### Методы фрэймворка

```
@single function
function kf_core:kframe/method/entity_count {type:<type>}
    ⤷ Выводит количество сущностей определённого типа в мире

@single function
function kf_core:kframe/method/on_start_reset
    ⤷ Обнуляет on_start функцию для активации после перезахода в мир
```

### Активация нэймспейсов фрэймворка

Нэймспейсы выключены по умолчанию для оптимизации, чтобы активировать их функции нужно
вручную прописывать команды в load и tick с перенаправлением на tick и load нэймспейса

```
@single on_load function

function kf_inputs:load
```

```
@tick on_tick function

function kf_inputs:tick
```

# Диалоги

Диалоги - динамическая система title actionbar выводов с эффектом печатной машинки.

- [Создание диалога](#создание-диалога)
- [Удаление диалога](#удаление-диалога)
- [Обнуление диалога](#обнуление-диалога)
- [Вывод диалога](#вывод-диалога)

### Создание диалога

```
@single function

function kf_dialogue:create {node:,text:"",author:{text:""},step:1,selector:"@a",display:{color:gray},command:"",delay:1}
```

```
function kf_dialogue:create {
    node:d1,
    text:" Привет Мир! Привет Мир!",
    author:{text:"[Koishem]",color:white},
    step:3,
    selector:"@a",
    display:{color:blue,italic:true},
    command:"playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 999",
    delay:3
}
```

```
node        | ID диалога
text        | Текст для вывода
author      | SNBT аргумент который вставляется в начало диалога
display     | SNBT аргумент для настройки текста (color, bold, italic, etc.)
selector    | Селектор сущностей которые увидят диалог
    ⤷ При вводе "type=text_display..." вывод диалога будет через указанную сущность
step        | Кол-во символов которое одновременно выводится в диалоге
    ⤷ Если "step" слишком большой - будет выведен весь диалог за раз
delay       | Задержка между каждым выводом символов
command     | Команда которая запускается при каждом выводе символов
    ⤷ Если не хочется выводить команду - можно вписать "return fail"
```

### Удаление диалога

```
@single function

function kf_dialogue:delete {node:<node>}
```

### Обнуление диалога

```
@single function

function kf_dialogue:reset with storage minecraft:kf_dialogue <node>
```

### Вывод диалога

```
@tick function

function kf_dialogue:iterate with storage minecraft:kf_dialogue <node>
```

# Сохранения

Сохранения - динамическая система с хранилищами по 10 ячеек. Хранилища содержат скорборды которые могут быть активированы для возвращения сохранённых значений

- [Создание сохранения](#создание-сохранения)
- [Заполнение ячеек](#заполнение-ячеек)
- [Принт сохранений](#принт-сохранений)
- [Активация сохранений](#активация-сохранений)
- [Редактирование ячеек](#редактирование-ячеек)
- [Удаление ячеек](#удаление-ячеек)

### Создание сохранения

```
@single function

function kf_quicksave:create {node:<node>}
```

### Заполнение ячеек

**append** метод заполняет последнюю свободную ячейку в сохранении. При удалении ячеек **append** не будет работать на пустых ячейках

```
@single function

function kf_quicksave:append {node:<node>,score:"<score>",obj:"<objective>"}
```

```
function kf_quicksave:append {
    node:save1,
    score:".FakePlayer",
    obj:"testing"
}
```

```
node        | ID сохранения
score       | Фэйк игрок / селектор игрока к которому привязан скорборд
obj         | Objective скорборда
```

### Принт сохранений

Выводит ID сохранения и все его ячейки в чат

```
function kf_quicksave:print {node:<node>}
```

### Активация сохранений

Возвращает значения скорбордов из сохранения обратно сущностям/фэйк игрокам

```
function kf_quicksave:activate {node:<node>}
```

### Редактирование ячеек

Изменяет ячейку через введённый ID ячейки. Счёт ячеек идёт от 0 до 9

```
function kf_quicksave:set {node:<node>,id:<id>,score:"<score>",obj:"<objective>"}
```

```
function kf_quicksave:set {
    node:save1,
    id:1,
    score:".val4",
    obj:Test
}
```

### Удаление ячеек

Освобождает ячейку от данных через ID сохранения и ID ячейки

```
function kf_quicksave:pop {node:<node>,id:<id>}
```

# Инпуты

Инпуты позволяют отслеживать нажатия определённых игроков [WASD, SPACE, CTRL, SHIFT, 0-9 слоты хотбара],
при этом адаптируя удобную манипуляцию через замыкание определённых инпутов для более точной отслежки и удобства

- [Методы](#методы)
- [Замыкание](#замыкание)
- [Отмыкание](#отмыкание)
- [Триггеры](#триггеры)
- [Одиночные триггеры](#одиночные-триггеры)

### Методы

```
@single function
execute as <@player> run function kf_inputs:method/toggle_lock {arg:<input>}
    ⤷ "Переключает" инпут определённому игроку с 0 на 1 и наоборот

@single function
execute as <@player> run function kf_inputs:method/check_chat
    ⤷ Выводит замкнутые инпуты определённого игрока в чат

@single function
execute as <@player> run function kf_inputs:method/check_actionbar
    ⤷ Выводит замкнутые инпуты определённого игрока над хотбаром

@tick function
execute as <@player> run function kf_inputs:method/check_trigger
    ⤷ Выводит нажатие клавиш определённого игрока над хотбаром
```

### Замыкание

Замыкание выключает отслеживание определённых инпутов у определённых игроков для
более гибкого управления

```
@single function

execute as <@player> run function kf_inputs:lock {input:<input>}
```

### Отмыкание

Отмыкание включает замкнутые триггеры, после чего отслеживание снова начинает работать

```
@single function

@single function

execute as <@player> run function kf_inputs:unlock {input:<input>}
```

### Триггеры

Отслеживает инпуты определённого игрока позволяя выводить команды через run

```
@tick function

execute as <@player> if function kf_inputs:trigger/w
execute as <@player> if function kf_inputs:trigger/a
execute as <@player> if function kf_inputs:trigger/s
execute as <@player> if function kf_inputs:trigger/d
execute as <@player> if function kf_inputs:trigger/ctrl
execute as <@player> if function kf_inputs:trigger/shift
execute as <@player> if function kf_inputs:trigger/space

execute as <@player> if function kf_inputs:trigger/slot1
execute as <@player> if function kf_inputs:trigger/slot2
execute as <@player> if function kf_inputs:trigger/slot3
execute as <@player> if function kf_inputs:trigger/slot4
execute as <@player> if function kf_inputs:trigger/slot5
execute as <@player> if function kf_inputs:trigger/slot6
execute as <@player> if function kf_inputs:trigger/slot7
execute as <@player> if function kf_inputs:trigger/slot8
execute as <@player> if function kf_inputs:trigger/slot9
```

### Одиночные триггеры

Работает точно так же, но при нажатии/зажатии запускает команду только один раз. В одной функции
может быть только один одиночный триггер.

При наличии двух триггеров на один инпут активироваться будет только первый

```
@tick function

execute as <@player> if function kf_inputs:trigger/single/w
execute as <@player> if function kf_inputs:trigger/single/a
execute as <@player> if function kf_inputs:trigger/single/s
execute as <@player> if function kf_inputs:trigger/single/d
execute as <@player> if function kf_inputs:trigger/single/ctrl
execute as <@player> if function kf_inputs:trigger/single/shift
execute as <@player> if function kf_inputs:trigger/single/space

execute as <@player> if function kf_inputs:trigger/single/slot1
execute as <@player> if function kf_inputs:trigger/single/slot2
execute as <@player> if function kf_inputs:trigger/single/slot3
execute as <@player> if function kf_inputs:trigger/single/slot4
execute as <@player> if function kf_inputs:trigger/single/slot5
execute as <@player> if function kf_inputs:trigger/single/slot6
execute as <@player> if function kf_inputs:trigger/single/slot7
execute as <@player> if function kf_inputs:trigger/single/slot8
execute as <@player> if function kf_inputs:trigger/single/slot9
```

# Таймеры

У **K-Framework** есть своя система таймеров основанная на ЧЧ:ММ:СС:ТТ | час : минута : секунда : тик

- [Создание таймера](#создание-таймера)
- [Удаление таймера](#удаление-таймера)
- [Настройка таймера](#настройка-таймера)
- [Активация таймера](#активация-таймера)
- [Обнуление таймера](#обнуление-таймера)
- [Вывод таймера](#вывод-таймера)

### Создание таймера

```
@single function

function kf_timers:create {node:,t:0,h:0,m:0,s:0,end_h:0,end_m:0,end_s:0,end_t:0,single:0,command:""}
```

```
function kf_timers:create {
    node:t1,
    t:0,
    h:0,
    m:0,
    s:57,
    end_h:0,
    end_m:1,
    end_s:0,
    end_t:0,
    single:1,
    command:"say hi"
}
```

```
node        | ID таймера
t           | Установка кол-ва тиков таймера
h           | Установка кол-ва часов таймера
m           | Установка кол-ва минут таймера
s           | Установка кол-ва секунд таймера
end_h       | Установка конечного значения часов таймера
end_m       | Установка конечного значения минут таймера
end_s       | Установка конечного значения секунд таймера
end_t       | Установка конечного значения тиков таймера
single      | 0 для циклического выполнения команды, 1 для одиночного
command     | Команда которая запускается при окончании таймера
    ⤷ Если не хочется выводить команду - можно вписать "return fail"
```

### Удаление таймера

```
@single function

function kf_timers:delete {node:<node>}
```

### Настройка таймера

```
@single function

function kf_timers:set {id:,arg:,value:}
```

```
function kf_timers:set {
    id:t1,
    arg:s,
    value:5
}
```

```
id          | ID таймера
arg         | Аргумент для изменения
    ⤷ Можно менять t, s, m, h, end_t, end_s, end_m, end_h, command
value       | Значение для аргумента
    ⤷ При смене command ставьте лапки {id:,arg:command,value:"say hello world"}
```

### Активация таймера

```
@tick function

function kf_timers:iterate with storage kf_timers <node>

function kf_timers:iterate {id:<node>}
```

### Обнуление таймера

```
@single function

function kf_timers:reset with storage kf_timers <node>

function kf_timers:reset {id:<node>}
```

### Вывод таймера

```
@tick function

function kf_timers:check {node:<node>}
```

# 3Д Триггеры
С помощью 3д триггеров можно создавать объёмные поля, которые будут реагировать на определённых энтити и запускать команду введённую разработчиком

- [Создание триггера](#создание-триггера)
- [Проверка триггера](#проверка-триггера)
- [Дебаг триггера](#дебаг-триггера)
- [Перемещение триггера вручную](#перемещение-триггера-вручную)
- [Обнуление триггера](#обнуление-триггера)
- [Удаление триггера](#удаление-триггера)

### Создание триггера

```
@single function

function kf_3d_triggers:create {node:,dx:,dy:,dz:,x:,y:,z:,command:"",single:,selector:"",color:""}
    ⤷ Команда вводится в функции датапака

function kf_3d_triggers:create_at_player {node:,dx:,dy:,dz:,single:,command:"",selector:"",color:""}
    ⤷ Команда вводится в чат игры
```

```
function kf_3d_triggers:create_at_player {
    node:t1,
    dx:0,
    dy:0,
    dz:0,
    single:0,
    command:"say hello world",
    selector:"@a",
    color:"red"
}
```

```
function kf_3d_triggers:create {
    node:t1,
    dx:1,
    dy:1,
    dz:1,
    x:8,
    y:-60,
    z:10,
    command:"say hi",
    single:1,
    selector:"@a",
    color:"lime"
}
```

```
node:t1,            | ID триггера
dx:1,               | dx триггера / размер триггер-куба по X координате. Принимает только целые числа, размер идёт от нуля (0х 0y 0z = блок)
dy:1,               | dy триггера / размер триггер-куба по Y координате. Принимает только целые числа, размер идёт от нуля (0х 0y 0z = блок)
dz:1,               | dz триггера / размер триггер-куба по Z координате. Принимает только целые числа, размер идёт от нуля (0х 0y 0z = блок)
x:8,                | x координата якоря / координата по x где триггер-куб будет создан
y:-60,              | y координата якоря / координата по y где триггер-куб будет создан
z:10,               | z координата якоря / координата по z где триггер-куб будет создан
command:"say hi",   | команда которая будет запускаться во время триггера
single:1,           | 0 для циклического выполнения команды, 1 для одиночного
selector:"@a",      | селектор сущностей на которых будет реагировать триггер
color:"red"         | цвет триггера который отображается при дебаге
```

### Проверка триггера

Проверка триггера нужна для основной проверки касания хитбокса энтити к выбранному триггеру. К тому же **дебаг** и **перемещение триггера вручную** работают только с включенным **check** и выбранным триггером. Такая система сделана в целях симплификации и уменьшения кол-ва функций

```
@tick function

function kf_3d_triggers:check {node:<node>}
```

### Дебаг триггера

Дебаг отключает/включает визуальное отображение триггеров. Переключать видимость можно только если запущен **function kf_3d_triggers:check** с указанным триггером. По умолчанию дебаг отключен

```
@single/tick function

function kf_3d_triggers:debug_on

function kf_3d_triggers:debug_off
```

### Перемещение триггера вручную

Перемещение позволяет вручную поставить триггер, который постоянно телепортируется к игроку. Перемещать триггеры можно только если запущен **function kf_3d_triggers:check** с указанным триггером. Спавн триггер-кубов можно делать и без перемещения вручную через обычную **function kf_3d_triggers:create**

```
@single function

 function kf_3d_triggers:move
    ⤷ Команда вводится в чат игры
```

### Обнуление триггера

Обнуление триггера с аргументом single:1 позволяет активировать триггер снова

```
@single function

function kf_3d_triggers:reset {node:<node>}
```

### Удаление триггера

```
@single function

function kf_3d_triggers:delete {node:<node>}
```