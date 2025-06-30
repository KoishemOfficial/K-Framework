<p align="center">
    <img src="icon.png" alt="K-Framework logo" width="150"/>
</p>
<h1 align="center">K-Framework</h1>
<h3 align="center">Датапак который упрощает разработку карт в Minecraft: Java Edition</h3>

# 🚀 Что такое K-Framework?
**K-Framework** это датапак с готовым набором инструментов для разработчиков карт, написанный специально для [**Midnight Games**](https://discord.gg/7gtdvHeTUZ)!

<br>

> [!WARNING]
> Фреймворк жертвует оптимизацией игры ради корректной работы некоторых модулей!

# 📦 Модули

- [<ins>Фреймворк</ins>](#фреймворк)
- [<ins>Диалоги</ins>](#диалоги)
- [<ins>Сохранения</ins>](#сохранения)
- [<ins>Инпуты</ins>](#инпуты)
- [<ins>Таймеры</ins>](#таймеры)
- [<ins>3Д триггеры</ins>](#3д-триггеры)
- [<ins>Лицензия</ins>](#лицензия)

<a id="фреймворк"><h1>🛠️ Фреймворк</h1></a>

- [@on_start функция](#on_start)
- [Контроль модулей](#контроль-модулей)

<a id="on_start"><h2>@on_start функция</h2></a>

**@on_start** вызывается один раз после запуска мира, как и **@on_load**.
После вызова функция блокируется до тех пор, пока её не разблокируют.

Используется в основном для инициализации или сброса скриптов карты.

```
@single function
function core:method/on_start_reset
    ⤷ Сбрасывает @on_start
```

<a id="контроль-модулей"><h2>Контроль модулей</h2></a>
Некоторые модули теряют свой функционал/не работают в принципе без включения.

По умолчанию модули отключены.

```
@single function
function core:method/module_control/<module>/on
function core:method/module_control/<module>/off
    ⤷ Включает выбранный модуль
```

У фреймворка есть особый модуль: dev_mode\
После его включения будут выводиться сообщения отладки

<a id="диалоги"><h1>💬 Диалоги</h1></a>

Диалоги это мультиплеер-френдли система создания объектов, через которые отображается текст в actionbar игрока, либо в text_display'и.

> [!WARNING]
> Диалоги используют большое количество макросов, жертвуя оптимизацией игры! Используйте в разумных количествах.

- [Создание диалога](#dialogue1)
- [Создание пресета](#dialogue2)
- [Создание очереди](#dialogue3)
- [Создание диалога через пресет](#dialogue4)
- [Активация диалога](#dialogue5)
- [Активация очереди](#dialogue6)
- [Сброс диалога](#dialogue7)
- [Сброс очереди](#dialogue8)
- [Удаление диалога](#dialogue9)
- [Удаление пресета](#dialogue10)
- [Удаление очереди](#dialogue11)
- [Удаление всех диалогов](#dialogue12)
- [Удаление всех пресетов](#dialogue13)
- [Удаление всех очередей](#dialogue14)

<a id="dialogue1"><h2>Создание диалога</h2></a>
Аргументы:
```
node
⤷ Название объекта диалога

text
⤷ Текст который будет выведен при активации

author
⤷ Начальная часть текста без эффекта печати, поддерживает вывод картинок: {text:"\uE000"}

display
⤷ Настройка стиля текста (цвет, жирность, курсив и т.д.)

selector
⤷ Отбор игроков которые увидят диалог, поддерживает text_display'и: selector:"@e[type=text_display]"

command
⤷ Выводит введённую команду при каждой итерации диалога, полезно для звуков печати.
Если команда не нужна - нужно вставить return failц

delay
⤷ Задержка между каждым выводом символов в тиках

step
⤷ Количество символов, которые диалог выводит за раз

stay
⤷ Задержка диалога в actionbar/text_display, при значении -1 медленно пропадает ванильным способом,
при значении выше -1 запускает таймер, по окончанию которого actionbar/text_display очищается
```
```
@single function
function modules:dialogue/create {node:,text:"",author:{text:""},selector:"@a",display:{color:gray},command:"",delay:1,step:1,stay:-1}
```
```
function modules:dialogue/create {\
    node:d1,\
    text:"Hello World!",\
    author:{text:"[Koishem] "},\
    display:{color:gray},\
    selector:"@a",\
    command:"return fail",\
    delay:1,\
    step:1,\
    stay:-1\
}
```

<a id="dialogue2"><h2>Создание пресета</h2></a>

Пресеты это готовые шаблоны для создания диалогов, в альтернативном смысле их можно рассмаривать как персонажей

Аргументы
```
name
⤷ Название пресета

author
⤷ Начальная часть текста без эффекта печати, поддерживает вывод картинок: {text:"\uE000"}

display
⤷ Настройка стиля текста (цвет, жирность, курсив и т.д.)

selector
⤷ Отбор игроков которые увидят диалог, поддерживает text_display'и: selector:"@e[type=text_display]"

command
⤷ Выводит введённую команду при каждой итерации диалога, полезно для звуков печати.
Если команда не нужна - нужно вставить return failц

delay
⤷ Задержка между каждым выводом символов в тиках

step
⤷ Количество символов, которые диалог выводит за раз

stay
⤷ Задержка диалога в actionbar/text_display, при значении -1 медленно пропадает ванильным способом,
при значении выше -1 запускает таймер, по окончанию которого actionbar/text_display очищается
```

```
@single function
function modules:dialogue/create_preset {name:<name>,author:{text:""},display:{color:white},selector:"@a",command:"",delay:1,step:1,stay:-1}
```

```
function modules:dialogue/create_preset {\
    name:preset1,\
    author:{color:red,text:""},\
    display:{color:white},\
    selector:"@a",\
    command:"",\
    delay:1,\
    step:1,\
    stay:-1\
}
```

<a id="dialogue3"><h2>Создание очереди</h2></a>

Очереди это набор диалогов которых разделяет таймер (аргумент stay диалога)
```
@single function
function modules:dialogue/create_queue {name:<name>,list:"<node1>, <node2>"}
```
```
function modules:dialogue/create_queue {\
    name:q1,\
    list:"d1, d2, d3"\
}
```

<a id="dialogue4"><h2>Создание диалога через пресет</h2></a>

```
@single function
function modules:dialogue/create_with {name:,node:,text:""}
```
```
function modules:dialogue/create_with {\
    name:preset1,\
    node:d3,\
    text:"Hello World!"\
}
```

<a id="dialogue5"><h2>Активация диалога</h2></a>

```
@tick function
function modules:dialogue/iterate {node:<node>}
```

<a id="dialogue6"><h2>Активация очереди</h2></a>

```
@tick function
function modules:dialogue/iterate_queue {name:<name>}
```

<a id="dialogue7"><h2>Сброс диалога</h2></a>

```
@single function
function modules:dialogue/reset_queue {node:<node>}
```

<a id="dialogue8"><h2>Сброс очереди</h2></a>

```
@single function
function modules:dialogue/reset_queue {name:<name>}
```

<a id="dialogue9"><h2>Удаление диалога</h2></a>

```
@single function
function modules:dialogue/delete {node:<node>}
```

<a id="dialogue10"><h2>Удаление пресета</h2></a>

```
@single function
function modules:dialogue/delete_preset {name:<preset>}
```

<a id="dialogue11"><h2>Удаление очереди</h2></a>

```
@single function
function modules:dialogue/delete_queue {name:<name>}
```

<a id="dialogue12"><h2>Удаление всех диалогов</h2></a>

```
@single function
function modules:dialogue/delete_all_nodes
```

<a id="dialogue13"><h2>Удаление всех пресетов</h2></a>

```
@single function
function modules:dialogue/delete_all_presets
```

<a id="dialogue14"><h2>Удаление всех очередей</h2></a>

```
@single function
function modules:dialogue/delete_all_queues
```

<a id="сохранения"><h1>💾 Сохранения</h1></a>

Сохранения это динамическая структура подобная векторам, которая хранит внутри себя скорборд значения, а именно score, obj и value

Score - фейк игрок либо селектор игроков\
Obj - objective скорборда\
Value - значение которое взимается автоматически

- [Создание сохранения](#quicksave1)
- [Вывод сохранения](#quicksave2)
- [Заполнение ячеек](#quicksave3)
- [Выделение новых ячеек](#quicksave4)
- [Очищение ячеек](#quicksave5)
- [Очищение всех ячеек](#quicksave6)
- [Удаление ячеек](#quicksave7)
- [Удаление сохранения](#quicksave8)
- [Удаление всех сохранений](#quicksave9)

<a id="quicksave1"><h2>Создание сохранения</h2></a>

```
@single function
function modules:quicksave/create {node:<node>,size:<size>}
```

```
function modules:quicksave/create {\
    node:save1,\
    size:5\
}
```

<a id="quicksave2"><h2>Вывод сохранения</h2></a>

Выводит содержимое сохранения в чат для отладки

```
@single function
function modules:quicksave/print {node:<node>}
```

<a id="quicksave3"><h2>Заполнение ячеек</h2></a>

Ячейки можно заполнять в два разных метода

Первый метод: **Append**

**Append** находит пустые ячейки внутри сохранения и заполняет их данными

```
@single function
function modules:quicksave/append {node:<node>,score:"<score>",obj:"<objective>"}
```

Второй метод: **Set**

**Set** нужен для редактирования/заполнения как пустых, так и занятых ячеек

Для того чтобы узнать ID ячейки выведите сохранение\
в чат через [вывод сохранения](#quicksave2). Не забывайте что ID начинаются с нуля!

```
@single function
function modules:quicksave/set {node:<node>,score:"<score>",obj:"<objective>",id:<id>}
```

<a id="quicksave4"><h2>Выделение новых ячеек</h2></a>

Через метод **grow** сохранения можно увеличивать в размере, добавляя новые пустые ячейки

```
@single function
function modules:quicksave/grow {node:<node>,size:<node>}
```

<a id="quicksave5"><h2>Очищение ячеек</h2></a>

Через метод **pop** можно освобождать занятые ячейки

Для того чтобы узнать ID ячейки выведите сохранение\
в чат через [вывод сохранения](#quicksave2). Не забывайте что ID начинаются с нуля!

```
@single function
function modules:quicksave/pop {node:<node>,id:<id>}
```

<a id="quicksave6"><h2>Очищение всех ячеек</h2></a>

```
@single function
function modules:quicksave/clear {node:<node>}
```

<a id="quicksave7"><h2>Удаление ячеек</h2></a>

Метод **shrink** удаляет существующие ячейки, уменьшая сохранения

Для того чтобы узнать ID ячейки выведите сохранение\
в чат через [вывод сохранения](#quicksave2). Не забывайте что ID начинаются с нуля!

```
@single function
function modules:quicksave/shrink {node:<node>,id:<id>}
```

<a id="quicksave8"><h2>Удаление сохранения</h2></a>

```
@single function
function modules:quicksave/delete {node:<node>}
```

<a id="quicksave9"><h2>Удаление всех сохранений</h2></a>

```
@single function
function modules:quicksave/delete_all
```

<a id="инпуты"><h1>⌨️ Инпуты</h1></a>

Инпуты - система для отслеживания нажатий от определённых игроков
Поддерживаемые отслежки: W, A, S, D, CTRL, SHIFT, SPACE, слоты хотбара 0-9

- [Методы](#inputs1)
- [Замыкание](#inputs2)
- [Отмыкание](#inputs3)
- [Триггеры](#inputs4)
- [Одиночные триггеры](#inputs5)

<a id="inputs1"><h2>Методы</h2></a>

Проверка нажатий и замыканий в actionbar

```
@tick function
execute as <@player> run function modules:inputs/method/check_trigger
```

Переключение замыкания для определённых инпутов\
Аргументы: w, a, s, d, ctrl, shift, space, slot1-slot9
```
@single function
execute as <@player> run function modules:inputs/method/toggle_lock {arg:<argument>}
```

<a id="inputs2"><h2>Замыкание</h2></a>

"Замыкает" инпут, отключая его отслеживание
Аргументы: w, a, s, d, ctrl, shift, space, slot1-slot9, all
```
@single function
execute as <@player> run function modules:inputs/lock {arg:<argument>}
```

<a id="inputs3"><h2>Отмыкание</h2></a>

"Отмыкает" инпут, включая его отслеживание
Аргументы: w, a, s, d, ctrl, shift, space, slot1-slot9, all
```
@single function
execute as <@player> run function modules:inputs/unlock {arg:<argument>}
```

<a id="inputs4"><h2>Триггеры</h2></a>

Проверяет определённый инпут и выводит команду

```
@tick function
execute as <@player> if function modules:inputs/trigger/<trigger> run <command>
```

<a id="inputs5"><h2>Одиночные триггеры</h2></a>

Проверяет определённый инпут и выводит команду\
Вместо постоянной активации, команда запускается один раз за нажатие

```
@tick function
execute as <@player> if function modules:inputs/trigger/single/<trigger> run <command>
```

<a id="таймеры"><h1>⏱️ Таймеры</h1></a>

У K-Framework есть система ЧЧ:ММ:СС:ТТ таймеров 

> [!WARNING]
> Таймеры используют большое количество макросов, жертвуя оптимизацией игры! Используйте в разумных количествах.

- [Создание таймера](#timers1)
- [Активация таймера](#timers2)
- [Вывод таймера](#timers3)
- [Обнуление таймера](#timers4)
- [Редактирование таймера](#timers5)
- [Удаление таймера](#timers6)
- [Удаление всех таймеров](#timers7)

<a id="timers1"><h2>Создание таймера</h2></a>

Аргументы
```
node
⤷ Название объекта таймера

h, m, s, t
⤷ Начальные значения таймера (h = hour, m = minute, s = second, t = tick)

end_h, end_m, end_s, end_t
⤷ Конечные значения таймера. h:m:s:t будут увеличиваться пока не будут равны end_h:end_m:end_s:end_t

single
⤷ При значении 0 команда таймера будет выполняться циклично,
при значении 1 команда таймера выполнится только один раз

command
⤷ Команда которая запустится по окончанию таймера. Если команда
не нужна - нужно прописать return fail
```

```
@single function
function modules:timers/create {node:,h:0,m:0,s:0,t:0,end_h:0,end_m:0,end_s:0,end_t:0,single:1,command:""}
```

```
function modules:timers/create {\
    node:t1,\
    h:0,\
    m:0,\
    s:0,\
    t:0,\
    end_h:0,\
    end_m:0,\
    end_s:5,\
    end_t:0,\
    single:1,\
    command:"say T1"\
}
```

<a id="timers2"><h2>Активация таймера</h2></a>

```
@tick function
function modules:timers/iterate {node:<node>}
```

<a id="timers3"><h2>Вывод таймера</h2></a>

```
@tick function
function modules:timers/display {node:<node>}
```

<a id="timers4"><h2>Обнуление таймера</h2></a>

```
@single function
function modules:timers/reset {node:<node>}
```

<a id="timers5"><h2>Редактирование таймера</h2></a>

Изменяет значения существующего таймера\
Принимает аргументы: h, m, s, t, end_h, end_m, end_s, end_t, single, command\
Если редактируется команда, value нужно вписывать в кавычках

```
@single function
function modules:timers/set {node:<node>,arg:<arg>,value:<value>}
```

<a id="timers6"><h2>Удаление таймера</h2></a>

```
@single function
function modules:timers/delete {node:<node>}
```

<a id="timers7"><h2>Удаление всех таймеров</h2></a>

```
@single function
function modules:timers/delete_all
```

<a id="3д-триггеры"><h1>📐 3Д триггеры</h1></a>

**3Д триггеры** это кубоидные dx dy dz зоны, через которые происходит\
отслежка других энтити

> [!WARNING]
> 3Д триггеры используют большое количество макросов, жертвуя оптимизацией игры! Используйте в разумных количествах.

- [Создание 3Д триггера](#3d_triggers1)
- [Активация 3Д триггера](#3d_triggers2)
- [Сброс 3Д триггера](#3d_triggers3)
- [Отображение 3Д триггера](#3d_triggers4)
- [Передвижение 3Д триггера](#3d_triggers5)
- [Удаление 3Д триггера](#3d_triggers6)
- [Удаление всех 3Д триггеров](#3d_triggers7)

<a id="3d_triggers1"><h2>Создание 3Д триггера</h2></a>

У 3д триггеров есть два типа, мелкие и большие триггеры. У мелких\
триггеров размер должен быть меньше 1 по всем координатам, например\
dx:0.5,dy:0.3,dz:0.2.
Большие триггеры имеют размер от 1 и выше по всем координатам

Создавать 3д триггеры можно в 2 разных метода

Метод **create**

```
@single function
function modules:3d_triggers/create {node:,dx:,dy:,dz:,x:,y:,z:,command:"",single:,selector:"",color:""}
```

```
function modules:3d_triggers/create {\
    node:,\
    dx:,\
    dy:,\
    dz:,\
    x:,\
    y:,\
    z:,\
    command:"",\
    single:,\
    selector:"",\
    color:""\
}
```

Аргументы
```
node
⤷ Название объекта триггера

dx, dy, dz
⤷ Размеры кубоидного триггера

x, y, z
⤷ Координаты на месте которых заспавнится

command
⤷ Команда которая запустится по при взаимодействии с триггером. Если команда
не нужна - нужно прописать return fail

single
⤷ При значении 0 команда триггера будет выполняться циклично,
при значении 1 команда триггера выполнится только один раз

selector
⤷ Селектор сущностей, на которых реагирует триггер

color
⤷ Цвет триггера. Нужен исключительно для отладки
```

Метод **create_at_player**

```
@single function
function modules:3d_triggers/create_at_player {node:,dx:,dy:,dz:,command:"",single:,selector:"",color:""}
```

```
function modules:3d_triggers/create_at_player {\
    node:,\
    dx:,\
    dy:,\
    dz:,\
    command:"",\
    single:,\
    selector:"",\
    color:""\
}
```

<a id="3d_triggers2"><h2>Активация 3Д триггера</h2></a>

```
@tick function
function modules:3d_triggers/activate {node:<node>}
```

<a id="3d_triggers3"><h2>Сброс 3Д триггера</h2></a>

```
@single function
function modules:3d_triggers/reset {node:<node>}
```

<a id="3d_triggers4"><h2>Отображение 3Д триггера</h2></a>

Отображает триггеры для отладки

```
@single function
function modules:3d_triggers/show_displays
```

```
@single function
function modules:3d_triggers/hide_displays
```

<a id="3d_triggers5"><h2>Передвижение 3Д триггера</h2></a>

Триггеры можно передвигать вручную. Offset - расстояние от игрока до триггера

```
@single function
function modules:3d_triggers/move {node:<node>,offset:<offset>}
```

<a id="3d_triggers6"><h2>Удаление 3Д триггера</h2></a>

```
@single function
function modules:3d_triggers/delete {node:<node>}
```

<a id="3d_triggers7"><h2>Удаление всех 3Д триггеров</h2></a>

```
@single function
function modules:3d_triggers/delete_all
```

<a id="лицензия"><h1>Лицензия</h1></a>

K-Framework распространяется по лицензии MIT.

Вы можете использовать, изменять и распространять материалы, при условии обязательного указания автора – Koishem.

Подробнее в LICENSE