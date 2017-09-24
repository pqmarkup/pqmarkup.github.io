>>‘\/‘‘(This page in English\Эта страница на английском)’[./..]’’

‘Описание синтаксиса пк-разметки’[./syntax]


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
}
}
}


Базовая реализация на языке Python:
. ‘Страница проекта pqmarkup в Python Package Index’[https://pypi.python.org/pypi/pqmarkup]
. ‘Ссылка на основной репозиторий’[https://bitbucket.org/pqmarkup/pqmarkup]


‘Статьи по пк-разметке\pqmarkup’{
. ‘Статья на Хабрахабре ‘‘Новый облегчённый язык разметки текста на основе парных кавычек (pq)’’’[-вставить ссылку после публикации статьи-]
}




><‘P‘https://www.paypalobjects.com/webstatic/mktg/Logo/pp-logo-100px.png’[https://www.paypal.me/pqmarkup ‘Please donate to prevent further development of this project (: and so to keep it at maximum stable state :).’]’