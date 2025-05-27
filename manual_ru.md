# K-Framework v. 0.1 от **Koishem**

Этот датапак написан мной - **Koishem**, специально для TF Studios и моих личных целей

Мой дискорд: **koishem**\
Мой телеграм: **@KoishemOff**\
Мой гитхаб: **[Link](https://github.com/KoishemOfficial)**

Сайт TF Studios: **[Website](https://timfilm-studios.github.io/official)**

## Навигация

- [Диалоги](#диалоги)

## Диалоги

- [Создание диалога](#создание-диалога)
- [Удаление диалога](#удаление-диалога)
- [Обнуление диалога](#обнуление-диалога)

### Создание диалога

```json
&single function

function kf_dialogue:create {node:,text:"",author:{text:""},step:1,selector:"@a",display:{color:gray},command:"",delay:1}
```

```json
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
step        | Кол-во символов которое одновременно выводится в диалоге
delay       | Задержка между каждым выводом символов
command     | Команда которая запускается при каждом выводе символов
```

### Удаление диалога

```json
&single function

function kf_dialogue:delete {node:<node>}
```

### Обнуление диалога

```json
&single function

function kf_dialogue:reset with storage minecraft:kf_dialogue <node>
```

### Вывод диалога

```json
&tick function

function kf_dialogue:iterate with storage minecraft:kf_dialogue <node>
```