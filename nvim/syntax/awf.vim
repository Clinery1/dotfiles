" Assembly With Functions syntax file


if exists("b:current_syntax")
    finish
endif


" make this syntax case sensitive
syntax case match


" struct, union
syntax keyword awfKeywords STRUCT UNION LABEL nextgroup=awfName skipwhite
syntax match awfName /[a-zA-Z_][a-zA-Z_0-9]*/ contained skipwhite

" enum
syntax keyword awfKeywords ENUM nextgroup=awfEnumTypeFirst,awfName skipwhite
syntax match awfEnumTypeFirst /:/ contained nextgroup=awfError,awfEnumType skipwhite
syntax keyword awfEnumType B S I LI LLI SF F LF UB US UI ULI ULLI contained nextgroup=awfName skipwhite

" impl
syntax keyword awfKeywords IMPL nextgroup=awfName skipwhite

" end
syntax keyword awfEnd END

" function
syntax keyword awfKeywords FN CFN nextgroup=awfReturnTypeColon,awfParameters,awfName skipwhite
syntax match awfReturnTypeColon /:/ contained nextgroup=awfError,awfReturnType skipwhite
syntax match awfReturnType /[a-zA-Z_][a-zA-Z_0-9]*/ contained nextgroup=awfParameters skipwhite
syntax region awfParameters start=/(/ end=/)/ contains=awfType,awfAngleBracket skipwhite nextgroup=awfName
syntax match awfKeyVal /[a-zA-Z_][a-zA-Z_0-9]*:[a-zA-Z_][a-zA-Z_0-9]*/ contained skipwhite

" label
syntax match awfFunctionLabel /#[A-Za-z_.][A-Za-z0-9_]*/ skipwhite

" use statement
syntax keyword awfKeywords USE skipwhite nextgroup=awfUsePath
" syntax match awfModPath "\w\(\w\)*::[^<]"he=e-3,me=e-3
syntax match awfUsePath /[A-Za-z_][A-Za-z0-9_]*/ contained skipwhite nextgroup=awfUsePathSeparator
syntax match awfUsePathSeparator /::/ skipwhite nextgroup=awfUsePath

" mod statement
syntax keyword awfKeywords MOD skipwhite nextgroup=awfName

" types
syntax keyword awfType B S I LI LLI SF F LF UB US UI ULI ULLI skipwhite
syntax keyword awfType ARRAY STR
syntax match awfType /BY[0-9]*/ skipwhite
syntax match awfType /BI[0-9]*/ skipwhite

" variables
syntax keyword awfKeywords var
syntax keyword awfKeywords val
syntax keyword awfKeywords gval
syntax keyword awfKeywords gvar

" other
syntax match awfComment /\/\/.*/ contains=awfTodo,awfWip
syntax region awfComment start=/\/\*/ end=/\*\// contains=awfTodo,awfWip
syntax match awfDocComment /\/\/\/.*/ contains=awfTodo,awfWip
syntax region awfDocComment start=/\/\*\*/ end=/\*\*\// contains=awfTodo,awfWip
syntax keyword awfTodo TODO contained
syntax keyword awfWip WIP contained
syntax match awfAngleBracket /[<>]/
syntax match awfError /[^a-zA-Z].*$/ skipwhite contained
syntax region awfString start=/"/ skip=/\\"/ end=/"/
" hopefully an r#""# string
syn region awfString start='b\?r\z(#*\)"' end='"\z1'

" x86_64 only
syn keyword awfX64Instruction syscall sysret
" standard instructions
syntax keyword awfStdInstruction mov add sub mul div ret call
syntax keyword awfStdInstruction and or  xor not shl shr rem
syntax keyword awfStdInstruction adc inc dec nop stc clc
syntax keyword awfStdInstruction cmp jmp jl  jle jg  jge je
syntax keyword awfStdInstruction jne jc  jnc
syntax keyword awfStdInstruction push pop

" numbers
" 
syntax match awfNumber /[0-9][0-9_]*/
syntax match awfNumber /[0-9][0-9_]*\.[0-9_]*/
syntax match awfNumber /0x[0-9A-Fa-f_]*/
syntax match awfNumber /[0-9A-Fa-f_]*h/
syntax match awfNumber /0b[01_]*/
syntax match awfNumber /0o[0-7_]*/
syntax keyword awfNumber Inf Infinity NaN


" highlights
hi link awfType Type
hi link awfKeywords Keyword
hi link awfComment Comment
hi link awfDocComment SpecialComment
hi link awfTodo Todo
hi link awfName Function
hi link awfError Error
hi link awfNumber Number
hi link awfStdInstruction SpecialKey
hi link awfString String
hi link awfSpecial Special

" copy highlights
hi link awfX64Instruction awfSpecial
hi link awfWip awfTodo
hi link awfNumberError awfError
hi link awfInstructnError awfError
hi link awfEnumType awfType
hi link awfReturnType awfType
hi link awfEnd awfKeywords
hi link awfAngleBracket awfKeywords
hi link awfFunctionLabel awfName
hi link awfUsePath awfName
hi link awfUsePathSeparator awfSpecial
