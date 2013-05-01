_interface "test.smi"

val _ = pthreadCreate (print o Int.toString) 1
val _ = pthreadCreate (print o str) #"f"
