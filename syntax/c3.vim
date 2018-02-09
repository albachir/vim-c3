if exists("b:current_syntax")
  finish
endif

" Code blocks
syntax region  c3ParenDecorator     contained matchgroup=jsParensDecorator     start=/(/  end=/)/  contains=@jsAll extend fold

" keywords (e.g. return, if, else, )
syntax keyword c3Keyword somekey
highlight link c3Keyword Keyword

" built-in functions
syntax keyword c3Function stored calc js py server

" C3 Types
"syntax match c3TypeName contained /\<\K\k*/ skipwhite skipempty nextgroup=jsFuncArgs,jsFlowFunctionGroup
syntax match c3TypeName contained /\<\K\k*/
syntax match c3Keyword /\<type\>/ skipwhite skipempty nextgroup=c3TypeName,c3Key skipwhite
syntax match c3Keyword /\<mixes\>/ skipwhite skipempty nextgroup=c3TypeName skipwhite
syntax match c3Keyword /\<extends\>/ skipwhite skipempty nextgroup=c3TypeName skipwhite
syntax match c3Keyword /\<transforms\>/ skipwhite skipempty nextgroup=c3TypeName skipwhite

" C3 primitive types
syntax keyword c3Type enum string int double decimal float datetime boolean

" C3 annotations
"syntax match  c3AnnotationArgs contained /\<\K\k*/
syntax region c3AnnotationArgs contained start=/(/  end=/)/ contains=c3FuncArgCommas,c3Comment,c3Expression skipwhite skipempty extend fold
syntax match  c3FuncArgCommas        contained ','
syntax region c3Expression     contained matchgroup=c3AnnotationArgs start=/=/ end=/[,)]\@=/ contains=@jsExpression extend

syntax match  c3AnnotationDFE /\<@DFE\>/ skipwhite skipempty nextgroup=c3AnnotationArgs skipwhite
syntax match  c3AnnotationDB /\<@db\>/ skipwhite skipempty nextgroup=c3AnnotationArgs skipwhite
syntax match  c3AnnotationTS /\<@ts\>/ skipwhite skipempty nextgroup=c3AnnotationArgs skipwhite


syntax keyword c3Key     key
syntax keyword c3Keyword entity
syntax keyword c3Keyword schema name
syntax keyword c3Keyword extendable remix

" Comments
syntax keyword c3CommentTodo    contained TODO FIXME XXX TBD
syntax region  c3Comment        start=+//+ end=/$/ contains=c3CommentTodo,@Spell extend keepend
syntax region  c3Comment        start=+/\*+  end=+\*/+ contains=c3CommentTodo,@Spell fold extend keepend

" Decorators
syntax match   c3Decorator                    /^\s*@/ nextgroup=c3DecoratorFunction
syntax match   c3DecoratorFunction  contained /\h[a-zA-Z0-9_.]*/ nextgroup=c3ParenDecorator

" Operators
syntax match c3Operator "\v\:"
syntax match c3Operator "\v\="
syntax match c3Operator "\v\~"
syntax match c3Operator "\v\!"

" Boolean
syntax keyword c3BooleanTrue    true
syntax keyword c3BooleanFalse   false

" Strings
syntax region c3String start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region c3String start=/\v'/ skip=/\v\\./ end=/\v'/

highlight link c3String String
highlight link c3BooleanTrue          Boolean
highlight link c3BooleanFalse         Boolean

highlight link c3Keyword     StorageClass
highlight link c3Key         StorageClass
highlight link c3Type        Type

highlight link c3CommentTodo Todo
highlight link c3Comment     Comment
highlight link c3Operator    Operator
"highlight link c3TypeName    Function

highlight link c3Function     Function
highlight link c3AnnotationDFE Function
highlight link c3FuncParens    Noise


let b:current_syntax="c3"
