module regex

/*
	* V bindings for lpcre library
	* http://www.pcre.org/
	* lib_pcre.v
	* https://github.com/shellbear/v-regex
*/


// TODO: windows support

#flag linux  -lpcre
#flag darwin -lpcre
#flag windows -lpcre
#flag freebsd -I/usr/local/include
#flag freebsd -Wl,-L,/usr/local/lib,-lpcre

#include <pcre.h>

struct C.pcre {}
struct C.pcre_extra {}


fn C.pcre_compile(byteptr, int, &byteptr, &int, voidptr) &C.pcre
fn C.pcre_compile2(byteptr, int, &int, &byteptr, &int, byteptr) &C.pcre
fn C.pcre_copy_named_substring(&C.pcre, byteptr, &int, int, byteptr, byteptr, int) int
fn C.pcre_copy_substring(byteptr, &int, int, int, byteptr, int) int
fn C.pcre_dfa_exec(&C.pcre, &C.pcre_extra, byteptr, int, int, int, &int, int, &int, int) int
fn C.pcre_study(&C.pcre, int, &byteptr) &C.pcre_extra
fn C.pcre_exec(&C.pcre, &C.pcre_extra, byteptr, int, int, int, &int, int) int
fn C.pcre_fullinfo(&C.pcre, &C.pcre_extra, int, voidptr) int
fn C.pcre_get_stringnumber(&C.pcre, byteptr) int
fn C.pcre_get_stringtable_entries(&C.pcre, byteptr, &byteptr, &byteptr) int
fn C.pcre_get_substring(byteptr, &int, int, int, &byteptr) int
fn C.pcre_get_substring_list(byteptr, &int, int, &byteptr) int
fn C.pcre_get_named_substring(&C.pctr, byteptr, &int, int, byteptr, &byteptr) int
fn C.pcre_maketables() byteptr
fn C.pcre_refcount(&C.pcre, int) int
fn C.pcre_version() byteptr
fn C.pcre_free_substring_list(&byteptr)
fn C.pcre_free_substring(byteptr)
fn C.pcre_free_study(&C.pcre_extra)
fn C.pcre_free(voidptr)

fn dummy_func_to_avoid_a_v_bug(){
}

//////////////////////////////////////////////////////////////////////////////////

// Options that can be passed to pcre_compile()
/*
	PCRE_CASELESS
	PCRE_MULTILINE
	PCRE_DOTALL
	PCRE_EXTENDED
	PCRE_ANCHORED
	PCRE_DOLLAR_ENDONLY
	PCRE_EXTRA
	PCRE_NOTBOL
	PCRE_NOTEOL
	PCRE_UNGREEDY
	PCRE_NOTEMPTY
	PCRE_UTF8
	PCRE_UTF16
	PCRE_UTF32
	PCRE_NO_AUTO_CAPTURE
	PCRE_NO_UTF8_CHECK
	PCRE_NO_UTF16_CHECK
	PCRE_NO_UTF32_CHECK
	PCRE_AUTO_CALLOUT
	PCRE_PARTIAL_SOFT
	PCRE_PARTIAL
	PCRE_NEVER_UTF
	PCRE_DFA_SHORTEST
	PCRE_NO_AUTO_POSSESS
	PCRE_DFA_RESTART
	PCRE_FIRSTLINE
	PCRE_DUPNAMES
	PCRE_NEWLINE_CR
	PCRE_NEWLINE_LF
	PCRE_NEWLINE_CRLF
	PCRE_NEWLINE_ANY
	PCRE_NEWLINE_ANYCRLF
	PCRE_BSR_ANYCRLF
	PCRE_BSR_UNICODE
	PCRE_JAVASCRIPT_COMPAT
	PCRE_NO_START_OPTIMIZE
	PCRE_NO_START_OPTIMISE
	PCRE_PARTIAL_HARD
	PCRE_NOTEMPTY_ATSTART
	PCRE_UCP
*/

// Request types for pcre_fullinfo()
/*
	PCRE_INFO_OPTIONS
	PCRE_INFO_SIZE
	PCRE_INFO_CAPTURECOUNT
	PCRE_INFO_BACKREFMAX
	PCRE_INFO_FIRSTBYTE
	PCRE_INFO_FIRSTCHAR
	PCRE_INFO_FIRSTTABLE
	PCRE_INFO_LASTLITERAL
	PCRE_INFO_NAMEENTRYSIZE
	PCRE_INFO_NAMECOUNT
	PCRE_INFO_NAMETABLE
	PCRE_INFO_STUDYSIZE
	PCRE_INFO_DEFAULT_TABLES
	PCRE_INFO_OKPARTIAL
	PCRE_INFO_JCHANGED
	PCRE_INFO_HASCRORLF
	PCRE_INFO_MINLENGTH
	PCRE_INFO_JIT
	PCRE_INFO_JITSIZE
	PCRE_INFO_MAXLOOKBEHIND
	PCRE_INFO_FIRSTCHARACTER
	PCRE_INFO_FIRSTCHARACTERFLAGS
	PCRE_INFO_REQUIREDCHAR
	PCRE_INFO_REQUIREDCHARFLAGS
	PCRE_INFO_MATCHLIMIT
	PCRE_INFO_RECURSIONLIMIT
	PCRE_INFO_MATCH_EMPTY
*/

// Exec-time and get/set-time error codes
/*
	PCRE_ERROR_NOMATCH
	PCRE_ERROR_NULL
	PCRE_ERROR_BADOPTION
	PCRE_ERROR_BADMAGIC
	PCRE_ERROR_UNKNOWN_OPCODE
	PCRE_ERROR_UNKNOWN_NODE
	PCRE_ERROR_NOMEMORY
	PCRE_ERROR_NOSUBSTRING
	PCRE_ERROR_MATCHLIMIT
	PCRE_ERROR_CALLOUT
	PCRE_ERROR_BADUTF8
	PCRE_ERROR_BADUTF16
	PCRE_ERROR_BADUTF32
	PCRE_ERROR_BADUTF8_OFFSET
	PCRE_ERROR_BADUTF16_OFFSET
	PCRE_ERROR_PARTIAL
	PCRE_ERROR_BADPARTIAL
	PCRE_ERROR_INTERNAL
	PCRE_ERROR_BADCOUNT
	PCRE_ERROR_DFA_UITEM
	PCRE_ERROR_DFA_UCOND
	PCRE_ERROR_DFA_UMLIMIT
	PCRE_ERROR_DFA_WSSIZE
	PCRE_ERROR_DFA_RECURSE
	PCRE_ERROR_RECURSIONLIMIT
	PCRE_ERROR_NULLWSLIMIT
	PCRE_ERROR_BADNEWLINE
	PCRE_ERROR_BADOFFSET
	PCRE_ERROR_SHORTUTF8
	PCRE_ERROR_SHORTUTF16
	PCRE_ERROR_RECURSELOOP
	PCRE_ERROR_JIT_STACKLIMIT
	PCRE_ERROR_BADMODE
	PCRE_ERROR_BADENDIANNESS
	PCRE_ERROR_DFA_BADRESTART
	PCRE_ERROR_JIT_BADOPTION
	PCRE_ERROR_BADLENGTH
	PCRE_ERROR_UNSET

	// Specific error codes for UTF-8 validity checks
	PCRE_UTF8_ERR0
	PCRE_UTF8_ERR1
	PCRE_UTF8_ERR2
	PCRE_UTF8_ERR3
	PCRE_UTF8_ERR4
	PCRE_UTF8_ERR5
	PCRE_UTF8_ERR6
	PCRE_UTF8_ERR7
	PCRE_UTF8_ERR8
	PCRE_UTF8_ERR9
	PCRE_UTF8_ERR10
	PCRE_UTF8_ERR11
	PCRE_UTF8_ERR12
	PCRE_UTF8_ERR13
	PCRE_UTF8_ERR14
	PCRE_UTF8_ERR15
	PCRE_UTF8_ERR16
	PCRE_UTF8_ERR17
	PCRE_UTF8_ERR18
	PCRE_UTF8_ERR19
	PCRE_UTF8_ERR20
	PCRE_UTF8_ERR21
	PCRE_UTF8_ERR22
*/


// Specific error codes for UTF-16 validity checks
/*
	PCRE_UTF16_ERR0
	PCRE_UTF16_ERR1
	PCRE_UTF16_ERR2
	PCRE_UTF16_ERR3
	PCRE_UTF16_ERR4
*/

// Specific error codes for UTF-32 validity checks
/*
	PCRE_UTF32_ERR0
	PCRE_UTF32_ERR1
	PCRE_UTF32_ERR2
	PCRE_UTF32_ERR3
*/

// Request types for pcre_config()
/*
	PCRE_CONFIG_UTF8
	PCRE_CONFIG_NEWLINE
	PCRE_CONFIG_LINK_SIZE
	PCRE_CONFIG_POSIX_MALLOC_THRESHOLD
	PCRE_CONFIG_MATCH_LIMIT
	PCRE_CONFIG_STACKRECURSE
	PCRE_CONFIG_UNICODE_PROPERTIES
	PCRE_CONFIG_MATCH_LIMIT_RECURSION
	PCRE_CONFIG_BSR
	PCRE_CONFIG_JIT
	PCRE_CONFIG_UTF16
	PCRE_CONFIG_JITTARGET
	PCRE_CONFIG_UTF32
	PCRE_CONFIG_PARENS_LIMIT
*/

// Request types for pcre_study()
/*
	PCRE_STUDY_JIT_COMPILE
	PCRE_STUDY_JIT_PARTIAL_SOFT_COMPILE
	PCRE_STUDY_JIT_PARTIAL_HARD_COMPILE
	PCRE_STUDY_EXTRA_NEEDED
*/

