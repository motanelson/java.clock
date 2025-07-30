' Criar ficheiro main.wasm com função sum(a:i32, b:i32):i32 { return a + b }

Dim As UByte filetype(0 To 3)      = {0, Asc("a"), Asc("s"), Asc("m")}
Dim As UByte version(0 To 3)       = {1, 0, 0, 0}

Dim As UByte sectiontype           = 1
Dim As UByte sectionsize           = 7

Dim As UByte numbertypes           = 1
Dim As UByte funcs                 = &h60
Dim As UByte parametrs             = 2
Dim As UByte parametrsid1          = &h7f
Dim As UByte parametrsid2          = &h7f
Dim As UByte numberofresults       = 1
Dim As UByte returnvalue           = &h7f

Dim As UByte functionid            = 3
Dim As UByte sectionsize2          = 2
Dim As UByte numberoffunctions     = 1
Dim As UByte indexcodes            = 0

Dim As UByte exports               = 7
Dim As UByte sectionsize3          = 7
Dim As UByte numberexports         = 1
Dim As UByte lenname               = 3
Dim As UByte exportmode            = 0
Dim As UByte exportindex           = 0
Dim As String funcname             = "sum"

Dim As UByte sectioncode           = &h0a
Dim As UByte setioncodesize        = 9
Dim As UByte functioncount         = 1
Dim As UByte functionbodysize      = 7
Dim As UByte localdecl             = 0

Dim As UByte codes(0 To 5)         = {&h20, 0, &h20, 1, &h6a, &hb}

color 0,6
cls

' Criar ficheiro binário
Open "main.wasm" For Binary As #1
Print "A criar ficheiro main.wasm..."

' Escrever cabeçalho e seções
Put #1,, filetype()
Put #1,, version()
Put #1,, sectiontype
Put #1,, sectionsize
Put #1,, numbertypes
Put #1,, funcs
Put #1,, parametrs
Put #1,, parametrsid1
Put #1,, parametrsid2
Put #1,, numberofresults
Put #1,, returnvalue

Put #1,, functionid
Put #1,, sectionsize2
Put #1,, numberoffunctions
Put #1,, indexcodes

Put #1,, exports
Put #1,, sectionsize3
Put #1,, numberexports
Put #1,, lenname
Put #1,, funcname
Put #1,, exportmode
Put #1,, exportindex

Put #1,, sectioncode
Put #1,, setioncodesize
Put #1,, functioncount
Put #1,, functionbodysize
Put #1,, localdecl
Put #1,, codes()

Close #1
Print "Ficheiro main.wasm criado com sucesso!"

