use IO.FormattedIO;

//writef("My favorite %s is %i\n", "number", 7);
//var s:string = "My favorite %s is %i".format("number",7);
//writeln(s);

//writef("|${#####}|\n", 2.0i);   //outputs: |   2i|
//writef("|%{#####.#}|\n", 2.0i); //outputs: |   2.0i|

writef("%5i %5s %5r\n", 1, "test", 6.34);
     // outputs:
     //    1  test  6.34

writef("%2.4z\n", 43.291 + 279.112i);
     // outputs:
     // 43.29 + 279.1i

writef("%<4u", 0x11223344);
     // outputs:
     // (hexdump of the output)
     // 4433 2211
writef("%>4u", 0x11223344);
     // outputs:
     // (hexdump of the output)
     // 1122 3344
writef("%<4i %<4i", 2, 32);
     // outputs:
     // (hexdump of the output -- note that spaces after
     //  a binary format specifier are ignored)
     // 0200 0000 2000 0000


writef("%|0S\n", "test");
     // outputs:
     // (hexdump of the output)
     // 7465 7374 000a
writef("%|1S\n", "test");
     // outputs:
     // (hexdump of the output)
     // 0474 6573 740a
writef("%>2S\n", "test");
     // outputs:
     // (hexdump of the output)
     // 0004 7465 7374 0a
writef("%>4S\n", "test");
     // outputs:
     // (hexdump of the output)
     // 0000 0004 7465 7374 0a
writef("%>8S\n", "test");
     // outputs:
     // (hexdump of the output)
     // 0000 0000 0000 0004 7465 7374 0a
writef("%|vS\n", "test");
     // outputs:
     // (hexdump of the output)
     // 04 7465 7374 0a

writef('%"S\n', "test \"\" \'\' !");
     // outputs:
     // "test \"\" '' !"
writef("%'S\n", "test \"\" \'\' !");
     // outputs:
     // 'test "" \'\' !'
writef("%{(S)}\n", "test ()", "(", ")");
     // outputs:
     // (test (\))


writef("%40s|\n", "test");
writef("%-40s|\n", "test");
     // outputs:
     //                                     test|
     // test                                    |

writef("123456\n");
writef("%6.6'S\n", "a");
writef("%6.6'S\n", "abcdefg");
writef("%.3'S\n", "a");
writef("%.3'S\n", "abcd");
     // outputs:
     // 123456
     //    'a'
     // 'a'...
     // 'a'
     // ''...


var s:string;
var got = readf(" %c", s);
// if the input is " a", "\na", "  a", etc, s will contain "a"
// if the input is "b", got will be false and s will contain ""

var s:string;
var got = readf("\n%c", s);
// if the input is "\na", or " \na", s will contain "a"
// if the input is "b", got will be false and s will be ""

var got = readf("%/a+/");
// if the input is "a" or "aa" (and so on), got will return true
// if the input is "c" got will be false

var s:string;
var got = readf("%/a(b+)/", s);
// if the input is "c" got will be false and s will be ""
// if the input is "ab", got will be true and s will be "b"
// if the input is "abb", got will be true and s will be "bb"
