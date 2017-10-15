python ..\pqmarkup\pqmarkup.py --output-html-document .pq -f index.html
@if not %ERRORLEVEL% == 0 pause
python ..\pqmarkup\pqmarkup.py --output-html-document ru.pq -f ru\index.html
@if not %ERRORLEVEL% == 0 pause
python ..\pqmarkup\pqmarkup.py --output-html-document ..\pqmarkup\docs\en\syntax.pq.txt -f syntax\index.html
@if not %ERRORLEVEL% == 0 pause
python ..\pqmarkup\pqmarkup.py --output-html-document ..\pqmarkup\docs\ru\syntax.pq.txt -f ru\syntax\index.html
@if not %ERRORLEVEL% == 0 pause
