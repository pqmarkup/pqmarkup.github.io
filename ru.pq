>>‘\/‘‘(This page in English\Эта страница на английском)’[./..]’’

Пк-разметка\pqmarkup — это ‘облегчённый язык разметки’[https://ru.wikipedia.org/wiki/Язык_разметки#.D0.9E.D0.B1.D0.BB.D0.B5.D0.B3.D1.87.D1.91.D0.BD.D0.BD.D1.8B.D0.B5_.D1.8F.D0.B7.D1.8B.D0.BA.D0.B8_.D1.80.D0.B0.D0.B7.D0.BC.D0.B5.D1.82.D0.BA.D0.B8] текста (как Markdown, BBCode, вики-разметка и т.п.), основанный на одиночных парных кавычках — символах `‘` и `’`.


*‘‘Описание синтаксиса пк-разметки.’[./syntax]’


‘‘Советы по набору’/‘способы набора’ символов одиночных парных кавычек ‘ и ’...’{
.‘В Windows можно использовать без дополнительных настроек сочетание клавиш Alt+0145 (на цифровой клавиатуре) для открывающей кавычки `‘` и Alt+0146 для закрывающей `’` (правда, работает это не во всех программах).
‘Визуально на цифровой клавиатуре эти цифры расположены очень удачно:’{
#‘
┌───┬───┐
│ 4 │ 5 │
├───┼───┘
│ 1 │
├───┴───┐
│ 0     │
└───────┘’
Похоже на открывающую квадратную скобочку `[`.'‘<!--]-->’'
Очень легко запомнить.
}’
.‘С помощью программы AutoHotkey[https://autohotkey.com/download/] можно назначить например сочетания клавиш [[[Right]]]Alt+9 и [[[Right]]]Alt+0 для ввода одиночных парных кавычек добавив такие две строчки в файл-скрипт настроек:
`
Alt & 9:: SendInput {‘}
Alt & 0:: SendInput {’}
`’
. ‘В SublimeText’{
1.‘Добавьте в файл настроек `Default (xxx).sublime-keymap` (можно открыть через меню Preferences -> Key Bindings):
Если у вас уже настроен ввод символа ‘[[[’]]] в AutoHotkey:
#(Javascript)‘
    { "keys": ["‘"], "command": "insert_pq" }, // ’ (for balance)
’Если не настроен:
#(Javascript)‘
    { "keys": ["alt+9"], "command": "insert_pq" }, // ‘ (for balance)
    { "keys": ["alt+0"], "command": "insert_snippet", "args": {"contents": "’"} },
    // pressing right alt+X is treated as ctrl+alt+X
    { "keys": ["ctrl+alt+9"], "command": "insert_pq" }, // ‘ (for balance)              
    { "keys": ["ctrl+alt+0"], "command": "insert_snippet", "args": {"contents": "’"} },
’’
2.‘Добавьте в файл[‘уже имеющийся в папке SublimeText/Data/Packages/User, либо можно создать новый py-файл в этой папке’] с расширением py (рядом с пользовательским .sublime-keymap):
#(Python)‘
def balance_pq_string(s): # на вход подаётся строка без кавычек, а на выходе строка уже в кавычках
    min_nesting_level = 0
    nesting_level = 0
    i = 0
    while i < len(s):
        ch = s[i]
        if ch == "‘":
            nesting_level += 1
        elif ch == "’":
            nesting_level -= 1
            min_nesting_level = min(min_nesting_level, nesting_level)
        i += 1
    nesting_level -= min_nesting_level
    return "'"*-min_nesting_level + "‘"*-min_nesting_level + "‘" + s + "’" + "’"*nesting_level + "'"*nesting_level

class insert_pq(sublime_plugin.TextCommand):
    def run(self, edit, prefix = '', postfix = ''):
        for ri, rgn in enumerate(self.view.sel()):
            self.view.replace(edit, rgn, prefix + balance_pq_string(self.view.substr(rgn)) + postfix)
            rgn = self.view.sel()[ri] # обновляем/актуализируем значение rgn
            self.view.sel().subtract(rgn)
            self.view.sel().add(sublime.Region(rgn.a+1+len(prefix), rgn.b-1-len(postfix)))

class pq_format_char(sublime_plugin.TextCommand):
    def run(self, edit, char):
        selected_text = self.view.substr(self.view.sel()[0])
        if selected_text == '':
            self.view.run_command("insert_snippet", {"contents": char})
        else:
            self.view.run_command("insert_pq", {"prefix": char})
’
’    
‘Можно дополнительно ещё добавить в файл настроек Default (xxx).sublime-keymap:’{
#(Javascript)‘
    { "keys": ["*"], "command": "pq_format_char", "args": {"char": "*"} },
    { "keys": ["_"], "command": "pq_format_char", "args": {"char": "_"} },
    { "keys": ["-"], "command": "pq_format_char", "args": {"char": "-"} },
    { "keys": ["~"], "command": "pq_format_char", "args": {"char": "~"} },
’
Так будет гораздо проще выделять текст жирным/подчёркиванием/зачёркиванием/курсивом (достаточно просто выделить текст и нажать клавишу соответствующего символа форматирования).
А также можно добавить:
#(Javascript)‘
    { "keys": [     "alt+`"], "command": "pq_format_char", "args": {"char": "~"} },
    { "keys": ["ctrl+alt+`"], "command": "pq_format_char", "args": {"char": "~"} },
    //(почему ~, а не ` — обычно код всё равно на английском и для ввода символа ` допустимо переключать раскладку)

    { "keys": [     "alt+3"], "command": "pq_format_char", "args": {"char": "#"} },
    { "keys": ["ctrl+alt+3"], "command": "pq_format_char", "args": {"char": "#"} },
    { "keys": [     "alt+2"], "command": "insert", "args": {"characters": "@"} },
    { "keys": ["ctrl+alt+2"], "command": "insert", "args": {"characters": "@"} },
    { "keys": [     "alt+4"], "command": "insert", "args": {"characters": "$"} },
    { "keys": ["ctrl+alt+4"], "command": "insert", "args": {"characters": "$"} },
    { "keys": [     "alt+6"], "command": "insert", "args": {"characters": "^"} },
    { "keys": ["ctrl+alt+6"], "command": "insert", "args": {"characters": "^"} },
    { "keys": [     "alt+7"], "command": "insert", "args": {"characters": "&"} },
    { "keys": ["ctrl+alt+7"], "command": "insert", "args": {"characters": "&"} },
’
Это пригодится для ввода символов #, @, $, ^ и & при активированной русской раскладке.
}
}
.‘В Android можно используя клавиатуру ‘Jbak Keyboard’[https://play.google.com/store/apps/details?id=com.jbak.JbakKeyboard] устанавливать собственные раскладки.
‘Вот архив’[./../files/keyboards.zip][{[-Я использую собранную мной {даю ссылку[./../files/Jbak%20Keyboard%20-%204PDA.htm] на копию[‘которую я успел вытащить из кэша Google после того как заметил пропажу своих сообщений’] этой темы, так как по оригинальной теме словно ураган прошёлся :)(: — многие сообщения при переносе/разделении тем куда-то пропали, и ‘у меня в профиле на 4pda.ru’[http://4pda.ru/forum/index.php?showuser=3122901] до сих пор ошибочно отображается наличие 2 сообщений, но сами сообщения при этом не находятся} ‘версию Jbak Keyboard’[./../files/test-JbakKeyboard-0.97.8.apk.zip ‘apk пришлось спрятать в zip, так как иначе GitHub ругается: It looks like you're using GitHub Pages to distribute binary files.’], в которой для выбора способа ввода (т.е. другой клавиатуры) используется код -508, и я не знаю, есть ли данный функционал в последней официальной версии, но я знаю, что он есть в ‘форке от wolf3d2’[https://play.google.com/store/apps/details?id=com.jbak2.JbakKeyboard] (правда не помню какой код используется там). Необходимо узнать, есть ли данная функциональность в оригинальной версии и поправить данные раскладки под неё.-]}] с раскладками с назначенными/добавленными символами ‘ и ’.’
}


Базовая реализация на языке Python:
. ‘Страница проекта pqmarkup в Python Package Index’[https://pypi.python.org/pypi/pqmarkup]
. ‘Ссылка на основной репозиторий’[https://bitbucket.org/pqmarkup/pqmarkup]


‘Статьи по пк-разметке\pqmarkup’{
. ‘Статья на Хабрахабре ‘‘Новый облегчённый язык разметки текста на основе парных кавычек (pq)’’’[-вставить ссылку после публикации статьи-]
}




><‘P‘https://www.paypalobjects.com/webstatic/mktg/Logo/pp-logo-100px.png’[https://www.paypal.me/pqmarkup ‘Please donate to prevent further development of this project (: and so to keep it at maximum stable state :).’]’