>>‘\/‘‘(Эта страница на русском\This page in Russian)’[./ru]’’

pqmarkup is a ‘lightweight markup language’[https://en.wikipedia.org/wiki/Lightweight_markup_language] (like Markdown, BBCode, Wiki markup, etc.), which is based on single paired quotation marks: characters `‘` and `’`.


*‘‘Syntax of pqmarkup.’[./syntax]’


‘How to type paired single quotation marks (characters ‘ and ’)...’{
.‘In Windows you can use without additional settings hotkey Alt+0145 (on the numeric keypad) for the [[[left/]]]opening quotation mark `‘` and hotkey Alt+0146 for the [[[right/]]]closing quotation mark `’`[[[ (though it works not at all programs/applications)]]].
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
. In ‘Sublime Text 3’[https://www.sublimetext.com/3] (for Windows, Linux, or macOS): just install ‘pqmarkup package’[https://packagecontrol.io/packages/pqmarkup].
.‘In Android you can use ‘Jbak Keyboard’[https://play.google.com/store/apps/details?id=com.jbak.JbakKeyboard], which allows you to customize your keyboard layout.
‘Here is a zip file’[./files/keyboards.zip] with keyboard layouts with added characters ‘ and ’.’
}


Original implementation in Python:
. ‘Project pqmarkup at the Python Package Index’[https://pypi.python.org/pypi/pqmarkup]
. ‘Link to the main repository’[https://bitbucket.org/pqmarkup/pqmarkup]


‘Articles on pqmarkup’{
. ‘Article on habrahabr.ru (in Russian) titled ‘‘Новый облегчённый язык разметки текста на основе парных кавычек (pq)’’’[-вставить ссылку после публикации статьи-]
}




><‘P‘https://www.paypalobjects.com/webstatic/mktg/Logo/pp-logo-100px.png’[https://www.paypal.me/pqmarkup ‘Please donate to prevent further development of this project (: and so to keep it at maximum stable state :).’]’