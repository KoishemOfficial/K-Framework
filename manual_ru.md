# K-Framework v. 1.0 от **Koishem**

**K-Framework** - набор инструментов для разработки карт внутри Minecraft.

Этот датапак написан мной - **Koishem**, специально для TF Studios и моих личных целей

Мой дискорд: **koishem**\
Мой телеграм: **@KoishemOff**\
Мой гитхаб: **[Link](https://github.com/KoishemOfficial)**

Сайт TF Studios: **[Website](https://timfilm-studios.github.io/official)**

# Навигация

- [Диалоги](#диалоги)
- [Сохранения](#сохранения)

# Диалоги

Диалоги - динамическая система title actionbar выводов с эффектом печатной машинки.

- [Создание диалога](#создание-диалога)
- [Удаление диалога](#удаление-диалога)
- [Обнуление диалога](#обнуление-диалога)

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
    ↳ При вводе "type=text_display..." вывод диалога будет через указанную сущность
step        | Кол-во символов которое одновременно выводится в диалоге
    ↳ Если "step" слишком большой - будет выведен весь диалог за раз
delay       | Задержка между каждым выводом символов
command     | Команда которая запускается при каждом выводе символов
    ↳ Если не хочется выводить команду - можно вписать "return fail"
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

function kf_quicksave:create {node:save1}
```

### Заполнение ячеек

**append** метод заполняет последнюю свободную ячейку в сохранении. При удалении ячеек **append** не будет работать на пустых ячейках

```
@single function

function kf_quicksave:append {node:,score:"",obj:""}
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
function kf_quicksave:print {node:}
```

### Активация сохранений

Возвращает значения скорбордов из хранилища обратно сущностям/фэйк игрокам

```
function kf_quicksave:activate {node:}
```

### Редактирование ячеек

Изменяет ячейку через введённый ID ячейки. Счёт ячеек идёт от 0 до 9

```
function kf_quicksave:set {node:,id:,score:"",obj:}
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
function kf_quicksave:pop {node:save1,id:1}
```