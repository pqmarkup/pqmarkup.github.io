>>‘\/‘‘(Эта страница на русском\This page in Russian)’[./ru]’’

‘Syntax of pqmarkup’[./syntax]


‘How to type paired single quotation marks (characters ‘ and ’)...’{
.‘In Windows you can use without additional settings hotkey Alt+0145 (on the numeric keypad) for the [[[left/]]]opening quotation mark `‘` and hotkey Alt+0146 for the [[[right/]]]closing quotation mark `’` (though it works not at all programs/applications).
‘By the way, this numbers on the numeric keypad are situated very felicitously:’{
#‘
┌───┬───┐
│ 4 │ 5 │
├───┼───┘
│ 1 │
├───┴───┐
│ 0     │
└───────┘’
It is similar to the left square bracket `[`.'‘<!--]-->’'
So it's very easy to remember.
}’
.‘Using program AutoHotkey[https://autohotkey.com/download/] you can assign for example hotkeys [[[Right]]]Alt+9 and [[[Right]]]Alt+0 to insert single quotation marks by adding this two lines in your ahk-file:
`
Alt & 9:: SendInput {‘}
Alt & 0:: SendInput {’}
`’
. ‘In SublimeText’{
1.‘Add following line(s) to `Default (xxx).sublime-keymap` file (it can be opened from menu Preferences -> Key Bindings):
If you have already assigned hotkey for inserting character ‘[[[’]]] in AutoHotkey:
#(Javascript)‘
    { "keys": ["‘"], "command": "insert_pq" }, // ’ (for balance)
’Otherwise:
#(Javascript)‘
    { "keys": ["alt+9"], "command": "insert_pq" }, // ‘ (for balance)
    { "keys": ["alt+0"], "command": "insert_snippet", "args": {"contents": "’"} },
    // pressing right alt+X is treated as ctrl+alt+X
    { "keys": ["ctrl+alt+9"], "command": "insert_pq" }, // ‘ (for balance)              
    { "keys": ["ctrl+alt+0"], "command": "insert_snippet", "args": {"contents": "’"} },
’’
2.‘Add to a py-file[‘already present in directory SublimeText/Data/Packages/User, or you can create new py-file in that directory’] (near with your .sublime-keymap file):
#(Python)‘
def balance_pq_string(s): # input: string without quotes, output: string surrounded with quotes
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
            rgn = self.view.sel()[ri]
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
‘You can also add this lines to Default (xxx).sublime-keymap:’{
#(Javascript)‘
    { "keys": ["*"], "command": "pq_format_char", "args": {"char": "*"} },
    { "keys": ["_"], "command": "pq_format_char", "args": {"char": "_"} },
    { "keys": ["-"], "command": "pq_format_char", "args": {"char": "-"} },
    { "keys": ["~"], "command": "pq_format_char", "args": {"char": "~"} },
’
This makes simpler to format text with bold/underline/strikethrough/italic (just select text and press corresponding key to format selected text).
}
}
}


Original implementation in Python:
. ‘Project pqmarkup at the Python Package Index’[https://pypi.python.org/pypi/pqmarkup]
. ‘Link to the main repository’[https://bitbucket.org/pqmarkup/pqmarkup]


‘Articles on pqmarkup’{
. ‘Article on habrahabr.ru (in Russian) titled ‘‘Новый облегчённый язык разметки текста на основе парных кавычек (pq)’’’[-вставить ссылку после публикации статьи-]
}




><‘P‘https://www.paypalobjects.com/webstatic/mktg/Logo/pp-logo-100px.png’[https://www.paypal.me/pqmarkup ‘Please donate to prevent further development of this project (: and so to keep it at maximum stable state :).’]’