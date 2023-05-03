/** Operating System Basic Services 
 * 
 * See_Also: https://nappgui.com/en/osbs/osbs.html
 */

module nappgui.osbs.osbs;

import nappgui.config;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

enum platform_t 
{
    ekWINDOWS = 1,
    ekMACOS,
    ekLINUX,
    ekIOS
}
mixin ExpandEnum!platform_t;

enum device_t 
{
    ekDESKTOP = 1,
    ekPHONE,
    ekTABLET
}
mixin ExpandEnum!device_t;

enum win_t 
{
    ekWIN_9x = 1,
    ekWIN_NT4,
    ekWIN_2K,
    ekWIN_XP,
    ekWIN_XP1,
    ekWIN_XP2,
    ekWIN_XP3,
    ekWIN_VI,
    ekWIN_VI1,
    ekWIN_VI2,
    ekWIN_7,
    ekWIN_71,
    ekWIN_8,
    ekWIN_81,
    ekWIN_10,
    ekWIN_NO
}
mixin ExpandEnum!win_t;

enum endian_t 
{
    ekLITEND = 1,
    ekBIGEND
}
mixin ExpandEnum!endian_t;

enum week_day_t 
{
    ekSUNDAY,
    ekMONDAY,
    ekTUESDAY,
    ekWEDNESDAY,
    ekTHURSDAY,
    ekFRIDAY,
    ekSATURDAY
}
mixin ExpandEnum!week_day_t;

enum month_t 
{
    ekJANUARY = 1,
    ekFEBRUARY,
    ekMARCH,
    ekAPRIL,
    ekMAY,
    ekJUNE,
    ekJULY,
    ekAUGUST,
    ekSEPTEMBER,
    ekOCTOBER,
    ekNOVEMBER,
    ekDECEMBER
}
mixin ExpandEnum!month_t;

enum file_type_t 
{
    ekARCHIVE = 1,
    ekDIRECTORY,
    ekOTHERFILE
}
mixin ExpandEnum!file_type_t;

enum file_mode_t 
{
    ekREAD = 1,
    ekWRITE,
    ekAPPEND
}
mixin ExpandEnum!file_mode_t;

enum file_seek_t 
{
    ekSEEKSET = 1,
    ekSEEKCUR,
    ekSEEKEND
}
mixin ExpandEnum!file_seek_t;

enum ferror_t 
{
    ekFEXISTS = 1,
    ekFNOPATH,
    ekFNOFILE,
    ekFBIGNAME,
    ekFNOFILES,
    ekFNOEMPTY,
    ekFNOACCESS,
    ekFLOCK,
    ekFBIG,
    ekFSEEKNEG,
    ekFUNDEF,
    ekFOK
}
mixin ExpandEnum!ferror_t;

enum perror_t 
{
    ekPPIPE = 1,
    ekPEXEC,
    ekPOK
}
mixin ExpandEnum!perror_t;

enum serror_t 
{
    ekSNONET = 1,
    ekSNOHOST,
    ekSTIMEOUT,
    ekSSTREAM,
    ekSUNDEF,
    ekSOK
}
mixin ExpandEnum!serror_t;

struct Dir;
struct File;
struct Mutex;
struct Proc;
struct DLib;
struct Thread;
struct Socket;

alias FPtr_thread_main = uint32_t function(void *data);
bool IS_THREAD_MAIN(alias fun, T) = is(typeof(&fun) : uint32_t function(T*));
void FUNC_CHECK_THREAD_MAIN(alias fun, T)() {
    static assert(IS_THREAD_MAIN!(fun, T));
}

alias FPtr_libproc =  void function();

struct Date
{
    int16_t year;
    uint8_t month;
    uint8_t wday;
    uint8_t mday;
    uint8_t hour;
    uint8_t minute;
    uint8_t second;
}

void osbs_start();

void osbs_finish();

platform_t osbs_platform();

win_t osbs_windows();

endian_t osbs_endian();

void osbs_memory_mt(Mutex *mutex);
