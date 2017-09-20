>>‘\/‘‘(Эта страница на русском\This page in Russian)’[./ru]’’
‘Syntax of pqmarkup’[./syntax]

‘How to type paired single quotation marks (characters ‘ and ’)...’{
.‘In Windows you can use without additional settings hotkeys Alt+0145 (on the numeric keypad) for left mark `‘` and Alt+0146 for right mark `’` (though it works not at all programs/applications).
‘By the way, this numbers on the numeric keypad situated very felicitously:’{
#‘
┌───┬───┐
│ 4 │ 5 │
├───┼───┘
│ 1 │
├───┴───┐
│ 0     │
└───────┘’
It is similar to left square bracket `[`.'‘<!--]-->’'
It's very easy to remember.
}’
.‘Using program AutoHotkey[https://autohotkey.com/download/] you can assign for example hotkeys [[[Right]]]Alt+9 and [[[Right]]]Alt+0 to insert single quotation marks by adding this two lines in your ahk-file:
`
Alt & 9:: SendInput {‘}
Alt & 0:: SendInput {’}
`’
. ‘В SublimeText’{
[-TODO: translate corresponding text into English from ru.pq-]
}
}

Base implementation on Python:
. ‘Project pqmarkup at the Python Package Index’[https://pypi.python.org/pypi/pqmarkup]
. ‘Link to the main repository’[https://bitbucket.org/pqmarkup/pqmarkup]

‘Articles on pqmarkup’{
. ‘Article on habrahabr.ru (in Russian) titled ‘‘Новый облегчённый язык разметки текста на основе одиночных парных кавычек (pq)’’’[-вставить ссылку после публикации статьи-]
}
