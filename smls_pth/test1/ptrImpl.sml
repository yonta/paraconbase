_interface "ptrImpl.smi"

fun intPtr (x : int) = _cast(ref x) : int ptr
fun wordPtr (x : word) = _cast(ref x) : word ptr
fun word8Ptr (x : Word8.word) = _cast(ref x) : Word8.word ptr
fun charPtr (x : char) = _cast(ref x) : char ptr
fun realPtr (x : real) = _cast(ref x) : real ptr
fun real32Ptr (x : Real32.real) = _cast(ref x) : Real32.real ptr
fun ptrPtr (x : 'a ptr) = _cast(ref x) : 'a ptr ptr

fun intCast (x : unit ptr) = _cast(x) : int ptr
fun wordCast (x : unit ptr) = _cast(x) : word ptr
fun word8Cast (x : unit ptr) = _cast(x) : Word8.word ptr
fun charCast (x : unit ptr) = _cast(x) : char ptr
fun realCast (x : unit ptr) = _cast(x) : real ptr
fun real32Cast (x : unit ptr) = _cast(x) : Real32.real ptr
fun ptrCast (x : unit ptr) = _cast(x) : 'a ptr ptr
