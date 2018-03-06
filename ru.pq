>>‘\/‘‘(This page in English\Эта страница на английском)’[./..]’’

><‘\/‘\/‘\/‘\/‘\/‘
```
████                                    ████
  ██                                    ██  
  ████  ████  ████        ████  ████  ████  
    ██    ████    ██    ██    ████    ██    
          ██      ██    ██      ██          
          ██      ██    ██      ██          
          ██      ██    ██      ██          
          ████████        ████████          
          ██                    ██          
        ██████                ██████        
```
’’’’’’


пк-разметка\pqmarkup — это ‘облегчённый язык разметки’[https://ru.wikipedia.org/wiki/Язык_разметки#.D0.9E.D0.B1.D0.BB.D0.B5.D0.B3.D1.87.D1.91.D0.BD.D0.BD.D1.8B.D0.B5_.D1.8F.D0.B7.D1.8B.D0.BA.D0.B8_.D1.80.D0.B0.D0.B7.D0.BC.D0.B5.D1.82.D0.BA.D0.B8] текста (как Markdown, BBCode, вики-разметка и т.п.), основанный на одиночных[[[на мысль вставить сюда символ новой строки меня натолкнул тот факт, что на моём мониторе слова ‘парных кавычках’ оказались в самом начале новой [второй] строки после того, как я заменил ‘Пк-’ на ‘пк-’, но я отказался от этой идеи, чтобы не сбивать отображение этих строк в меньшем разрешении экрана ("аналогичный" символ новой строки в `pqmarkup/docs/ru/syntax.pq.txt` решил пока оставить)]]] парных кавычках — символах `‘` и `’`.


*‘[[[Описание ]]]‘Синтаксис пк-разметки.’[./syntax]’


‘‘Советы по набору’/‘способы набора’ символов одиночных парных кавычек ‘ и ’...’{
.‘В Windows можно использовать без дополнительных настроек сочетание клавиш Alt[‘в русской раскладке работает только через левый Alt’]+0145 (на цифровой клавиатуре) для открывающей кавычки `‘` и Alt+0146 для закрывающей `’`[[[ (правда, работает это не во всех программах)][-необходимо указать хотя бы один пример такой программы (вроде в Chrome не работало, но сейчас не повторяется/не воспроизводится)-]]].
‘Визуально на цифровой клавиатуре эти цифры расположены очень удачно:’{
```
┌───┬───┐
│ 4 │ 5 │
├───┼───┘
│ 1 │
├───┴───┐
│ 0     │
└───────┘
```
Похоже на открывающую квадратную скобочку `[`.'‘<!--]-->’'
Очень легко запомнить.
}’
.‘С помощью программы AutoHotkey[https://autohotkey.com/download/] можно назначить например сочетания клавиш [[[Right]]]Alt+9 и [[[Right]]]Alt+0 для ввода одиночных парных кавычек добавив такие две строчки в файл-скрипт настроек:
`
Alt & 9:: SendInput {‘}
Alt & 0:: SendInput {’}
`
‘В этот же файл-скрипт можно дополнительно ещё добавить:’{
[[[```
; Thanks to [https://autohotkey.com/docs/commands/_IfWinActive.htm
;            <- https://autohotkey.com/board/topic/117370-exclude-a-program-from-an-autohotkey/
;            <- google:‘autohotkey exclude sppecific program’]:‘#IfWinActive ahk_class Notepad’
; and thanks to ‘AutoHotkey’:‘Window Spy’:
```]]]```
#IfWinNotActive ahk_class CalcFrame ;allow using Alt+2..4 in Windows Calculator
Shift & 2:: SendInput {@}
Alt   & 2:: SendInput {"}
Shift & 3:: SendInput {#}
Alt   & 3:: SendInput {№}
Shift & 4:: SendInput {$}
Alt   & 4:: SendInput {;}
#IfWinNotActive
Shift & 6:: SendInput {^}
Alt   & 6:: SendInput {:}
Shift & 7:: SendInput {&}
Alt   & 7:: SendInput {?}

Alt   & -:: SendInput {—}
```[[[
/*
-   & Alt:: SendInput {—}
-::Send {-} ;https://autohotkey.com/docs/Hotkeys.htm#combo
*/
;Закомментировал, т.к. нажатие на `-` слишком медленно обрабатывается — следующие нажатия приходят раньше.
;;Точка (SC035) также обрабатывается медленно, но с ней эта проблема менее[?] заметна.
]]]```

RAlt  &  [:: SendInput {{}
RAlt  &  ]:: SendInput {}}
```[[[```;https://autohotkey.com/board/topic/61408-hotkeys-composed-of-three-keys/```]]]```
#If Getkeystate("Shift", "p") ; if shift is held the following hotkeys are active:
Ctrl  &  [:: SendInput {{} ;{ASC 123} ;здесь с RCtrl не работает Ctrl+Shift+[,]
Ctrl  &  ]:: SendInput {}} ;{ASC 125}
RAlt  & `;:: SendInput {`;}
#If !Getkeystate("Shift", "p")
RCtrl &  [:: SendInput {[} ;здесь с Ctrl не работает Ctrl+Shift+[,]
RCtrl &  ]:: SendInput {]}
LCtrl &  [:: SendInput {[}
LCtrl &  ]:: SendInput {]}
RAlt  & `;:: SendInput {:}
#If
RCtrl & `;:: SendInput {`;}

Alt   &  ':: SendInput {"}
Ctrl  &  ':: SendInput {'}
Alt   &  ,:: SendInput {<}
Alt   &  .:: SendInput {>}
```

Это позволит унифицировать ввод символов `@"#№$;^:&?[]{}'<>`, сделав его независимым от текущей раскладки.

А также можно добавить такое переназначение (впрочем, оно довольно спорное и неоднозначное) для двух самых сложных[‘Почему клавиша `\|/` сложная:
1. На разных клавиатурах она располагается по-разному (варианты: слева от клавиши Enter, между клавишами Enter и Backspace, слева от клавиши Backspace, справа от правого Shift).
2. На некоторых клавиатурах эта клавиша присутствует дважды: рядом с правым Shift и справа от левого Shift.
3. Нажатие на эту клавишу вводит символ `\` и в русской и в английской раскладках, но так как этот символ используется реже, чем `/`, то возникает соблазн переназначить эту клавишу так, чтобы она вводила символ `/` без Shift и символ `\` c нажатым Shift.’] клавиш на клавиатуре (включая единственную клавишу на русской клавиатуре, на которой нарисовано 4 символа): {
```
                          ; ┌─────┐
Shift & \:: SendInput {/} ; │ | / │
Ctrl  & \:: SendInput {|} ; │ \   │
Alt   & \:: SendInput {|} ; └─────┘

```[[[```; я узнал о SCxxx thanks to https://autohotkey.com/board/topic/35161-reprogram-left-slash-key/ <- google:‘autohotkey bing slash key’```]]]```
        SC035:: SendInput {.} ; ┌─────┐
Shift & SC035:: SendInput {,} ; │ ? , │
Alt   & SC035:: SendInput {?} ; │ / . │
RWin  & SC035:: SendInput {/} ; └─────┘
```

Хотя[[[...]]] {внимательно посмотрев на расположение этой клавиши {\/‘
‘Cougar 300K’[https://avatars.mds.yandex.net/get-marketpic/220472/market_oXpbPtUa0WIF0N5aiuysIg/orig archived:{[http://web.archive.org/web/20171113044325/https://avatars.mds.yandex.net/get-marketpic/220472/market_oXpbPtUa0WIF0N5aiuysIg/orig][http://archive.li/xTkTa ‘Error: Network error.’]} <- google[Картинки:Большие]:‘cougar 300k’]:
[[[{]]]'‘<!--[-->’'```
┌─────┐ ┌─────────┐
│ }   │ │         │
│ ] Ъ │ │         │
└─────┘ └─┐ ENTER │
  ┌─────┐ │ ◄───┘ │
  │ | / │ │       │
  │ \   │ │       │
  └─────┘ └───────┘
```’
} на самых {\/‘
‘A4Tech KBS-8’[https://media2.24aul.ru/imgs/58b84ecc73fce80994b309d6/ archived:{[http://web.archive.org/web/20171113045421/https://media2.24aul.ru/imgs/58b84ecc73fce80994b309d6/][http://archive.li/lF7Pc]} <- google[Картинки:Большие]:‘KBS-8’]:
[[[{]]]'‘<!--[-->’'```
   ┌─────┐ ┌─────────┐
   │ }   │ │         │
   │ ] Ъ │ │         │
   └─────┘ │         │
     ┌─────┘         │
     │ Enter◄─┘      │
     │               │
     └───────────────┘
┌────────────┐ ┌─────┐
│ △ Shift    │ │ |   │
│            │ │ \   │
└────────────┘ └─────┘
```’
} разных {\/‘
‘Sony VAIO VPCEC2M1R/WI’[http://static.nix.ru/autocatalog/sony/sony_notebook/102601_2253_draft.jpg archived:{[http://web.archive.org/web/20171113052955/http://static.nix.ru/autocatalog/sony/sony_notebook/102601_2253_draft.jpg][http://archive.li/xPNWY]} <- google[Картинки:Большие]:‘VPCEC2M1R/WI’]:
[[[{]]]'‘<!--[-->’'```
  ┌─────┐ ┌─────────┐
  │ }   │ │ |  /    │
  │ ] Ъ │ │ \       │
  └─────┘ └─────────┘
    ┌───────────────┐
    │ ◄───┘Enter    │
    │               │
    └───────────────┘
┌───────────────────┐
│ △ Shift           │
│                   │
└───────────────────┘
```’
} клавиатурах {\/‘
‘Genius K641/KB-29e’[http://static.nix.ru/autocatalog/keyboards_genius/24941_2245_draft.jpg archived:{[http://web.archive.org/web/20171113060426/http://static.nix.ru/autocatalog/keyboards_genius/24941_2245_draft.jpg][http://archive.li/aPILw]} <- google[Картинки:Большие]:‘kb-29e’]:
[[[{]]]'‘<!--[-->’'```
    ┌─────┐ ┌─────┐
    │ | / │ │ ◄─  │
    │ \   │ │     │
    └─────┘ └─────┘
┌─────┐ ┌─────────┐
│ }   │ │         │
│ ] Ъ │ │         │
└─────┘ │         │
  ┌─────┘         │
  │ ◄─┘Enter      │
  │               │
  └───────────────┘
```’
} у меня возникла такая мысль, что[[[...]]] {этой клавиши вообще быть не должно. [[[(:]]]:)
{Эта клавиша — кусочек, отколотый от [[[соответствующей ]]]клавиши Enter, или от клавиши Backspace, или от клавиши Shift. {И этот кусочек [[[нужно/]]]можно [[[просто ]]]назначить на ту клавишу, от которой он был отколот, но лучше просто оставить незадействованным, чтобы не путаться:

```
*\:: SendInput {}   ;[https://autohotkey.com/docs/Hotkeys.htm#Symbols]:‘
                    ;*...Wildcard: Fire the hotkey even if extra modifiers are being held down.’
```

А символы `\`, `|`, `/`, `.` и `,` {можно набирать посредством одной клавиши `/?,.`:
```
/*
                        ┌─────┐
                        │ ? , │
                        │ / . │
                        └─────┘
                       ┌┘  │  └┐
                       ┌───────┐
                       │   ,   │◄─ Shift
LCtrl, LWinKey, LAlt,  │   .   │
  Space\Пробел, RAlt ─►│ / | \ │◄─ AppsKey, RCtrl
                       └───────┘
                           ▲
                        RWinKey
*/
          SC035:: SendInput {.}
Shift   & SC035:: SendInput {,}
SC035   & Shift:: SendInput {,}
LCtrl   & SC035:: SendInput {/}
SC035   & LCtrl:: SendInput {/}
LWin    & SC035:: SendInput {/}
SC035   &  LWin:: SendInput {/}
Alt     & SC035:: SendInput {/}
SC035   &   Alt:: SendInput {/}
SC035   & Space:: SendInput {/}
;Space   & SC035:: SendInput {/}```[[[закомментировал эту строку, т.к. с ней не работает авто повторение зажатого пробела]]]```
RWin    & SC035:: SendInput {|}
SC035   &  RWin:: SendInput {|}
AppsKey & SC035:: SendInput {\}
SC035 & AppsKey:: SendInput {\}
RCtrl   & SC035:: SendInput {\}
SC035   & RCtrl:: SendInput {\}
```
}}}}}.
}
}’
.‘В ‘Sublime Text 3’[https://www.sublimetext.com/3] (для Windows, Linux или macOS): просто установите ‘плагин pqmarkup’[https://packagecontrol.io/packages/pqmarkup].[[[
‘Можно дополнительно ещё добавить в файл настроек User/Default.sublime-keymap:’{
#(Javascript)‘
    { "keys": [      "alt+`"], "command": "pq_format_char", "args": {"char": "~"} },
    { "keys": ["shift+alt+`"], "command": "insert", "args": {"characters": "`"} },

    { "keys": [   "shift+2"], "command": "insert", "args": {"characters": "@"} },
    { "keys": [     "alt+2"], "command": "insert", "args": {"characters": "\""} },
    { "keys": ["ctrl+alt+2"], "command": "insert", "args": {"characters": "\""} },
    { "keys": [   "shift+3"], "command": "pq_format_char", "args": {"char": "#"} },
    { "keys": [     "alt+3"], "command": "insert", "args": {"characters": "№"} },
    { "keys": ["ctrl+alt+3"], "command": "insert", "args": {"characters": "№"} },
    { "keys": [   "shift+4"], "command": "insert", "args": {"characters": "$"} },
    { "keys": [     "alt+4"], "command": "insert", "args": {"characters": ";"} },
    { "keys": ["ctrl+alt+4"], "command": "insert", "args": {"characters": ";"} },
    { "keys": [   "shift+6"], "command": "insert", "args": {"characters": "^"} },
    { "keys": [     "alt+6"], "command": "insert", "args": {"characters": ":"} },
    { "keys": ["ctrl+alt+6"], "command": "insert", "args": {"characters": ":"} },
    { "keys": [   "shift+7"], "command": "insert", "args": {"characters": "&"} },
    { "keys": [     "alt+7"], "command": "insert", "args": {"characters": "?"} },
    { "keys": ["ctrl+alt+7"], "command": "insert", "args": {"characters": "?"} },
’
Это позволит унифицировать ввод символов `@`, `"`, `#`, `№`, `$`, `;`, `^`, `:`, `&` и `?`, сделав его независимым от текущей раскладки.
}]Закомментировал, так как Shift+2 не работает в Sublime Text и это лучше делать через AutoHotkey.]]’
.‘В Android можно используя клавиатуру ‘Jbak Keyboard’[https://play.google.com/store/apps/details?id=com.jbak.JbakKeyboard] устанавливать собственные раскладки.
‘Вот архив’[./../files/keyboards.zip][{[-Я использую собранную мной {даю ссылку[./../files/Jbak%20Keyboard%20-%204PDA.htm] на ‘копию страницы’[‘которую я успел вытащить из кэша Google после того как заметил пропажу своих сообщений’] этой темы, так как по оригинальной теме словно ураган прошёлся [[[(:]]]:) — многие сообщения при переносе/разделении тем куда-то пропали, и ‘у меня в профиле на 4pda.ru’[http://4pda.ru/forum/index.php?showuser=3122901] до сих пор ошибочно отображается наличие 2 сообщений, но сами сообщения при этом не находятся} ‘версию Jbak Keyboard’[./../files/test-JbakKeyboard-0.97.8.apk.zip ‘apk пришлось спрятать в zip, так как иначе GitHub ругается: It looks like you're using GitHub Pages to distribute binary files.’], в которой для выбора способа ввода (т.е. другой клавиатуры) используется код -508, и я не знаю, есть ли данный функционал в последней официальной версии, но я знаю, что он есть в ‘форке от wolf3d2’[https://play.google.com/store/apps/details?id=com.jbak2.JbakKeyboard] (правда не помню какой код используется там). Необходимо узнать, есть ли данная функциональность в оригинальной версии и поправить данные раскладки под неё.-]}] с раскладками с назначенными/добавленными символами ‘ и ’.’
}


[[[Базовая/]Оригинальная[/Авторская] ]]Реализация на языке Python:
. ‘Страница проекта pqmarkup в Python Package Index’[https://pypi.python.org/pypi/pqmarkup]
. ‘Ссылка на основной репозиторий’[https://bitbucket.org/pqmarkup/pqmarkup]


Статьи по пк-разметке\pqmarkup:
. ‘Статья на Хабрахабре ‘‘Новый облегчённый язык разметки текста на основе парных кавычек (pq)’’’[https://habrahabr.ru/post/348218]


\/‘(: Кстати, пользуясь случаем, передаю привет m4[https://en.wikipedia.org/wiki/M4_(computer_language) ‘Unlike most languages, strings in m4 are quoted using the backtick (`) as the starting delimiter, and apostrophe (') as the ending delimiter. Separate starting and ending delimiters allows the arbitrary nesting of quotation marks in strings to be used...[[[ <- https://ru.wikipedia.org/wiki/Макропроцессор_m4 <- google:‘m4’ <- [http://www.linux.org.ru/forum/development/12280414/page1]:‘В C чудом осталась незанятой обратная кавычка, благодаря этому удалось более-менее сносно реализовать m4.’ <- https://bitbucket.org/budden/yar/src/4b7de82b26c6adfea6daedf23f656a6ea58ee26c/doc/обсуждения/лор-отнять-и-поделить.txt]]]’] и atx[http://web.archive.org/web/20040223210813/http://www.aaronsw.com/2002/atx/intro [[[ссылка на web.archive.org потому что в русской версии Windows страница [http://www.aaronsw.com/2002/atx/intro] отображается некорректно (по крайней мере, в Chrome и в Firefox)]]]<- https://en.wikipedia.org/wiki/Aaron_Swartz#atx <- вчера написал [pqmarkup/docs/ru/syntax.pq.txt]:‘Я постоянно путаюсь в обозначениях заголовков в других облегчённых языках разметки ...’, [[[‘]]]а сегодня решил поискать “atx’-style headers и наткнулся на atx]![‘И хотите верьте, хотите нет, но про m4 и atx я узнал уже после того, как мне пришла идея использовать одиночные парные кавычки в пк-разметке.’] :)’




><‘P‘https://www.paypalobjects.com/webstatic/mktg/Logo/pp-logo-100px.png’[https://www.paypal.me/pqmarkup ‘Please donate to prevent further development of this project (: and so to keep it at maximum stable state :).’]’