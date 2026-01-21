;; directives
(directive_start) @function.builtin
(directive_end) @function.builtin
(directive) @function.builtin

((directive) @include
 (#match? @include "^@(include|includeIf|includeWhen|includeFirst|includeUnless)$"))

((directive) @conditional
 (#match? @conditional "^@(if|elseif|else|endif|unless|endunless|switch|case|default|endswitch|empty|endempty|auth|guest|endauth|endguest|isset|endisset|production|env|endproduction|endenv|hasSection|sectionMissing)$"))

((directive) @repeat
 (#match? @repeat "^@(foreach|endforeach|forelse|endforelse|for|endfor|while|endwhile|break|continue)$"))

;; comments
(comment) @comment

;; parameters
(parameter) @variable.parameter
