type pthread_t = unit ptr   (* ToDo: system dependent *)
fun new_pthread_t_ref () =  ref (Pointer.NULL () : pthread_t)

val pthread_create =
    _import "pthread_create"
    : (pthread_t ref, unit ptr, 'a ptr -> unit ptr, 'a ptr) -> int

(* 普通の使い方 *)
fun f1 (x : unit ptr) =
    let val _ = (print o Int.toString o Pointer.load) (_cast (x) : int ptr)
    in  _NULL end
val x1 = _cast (ref 1) : unit ptr
val _ = pthread_create (new_pthread_t_ref (), _NULL, f1, x1)
fun f2 (x : unit ptr) =
    let val _ = (print o str o Pointer.load) (_cast (x) : char ptr)
    in  _NULL end
val x2 = _cast (ref #"a") : unit ptr
val _ = pthread_create (new_pthread_t_ref (), _NULL, f2, x2)

(* こう使いたい！！ *)
(* val pthreadCreate : 'a::{only ptr prefix type}. ('a -> unit) -> 'a -> int *)
fun pthreadCreate f x =
    let
      fun f' (x : unit ptr) =
          (f (Pointer.load (unitCast x));
           Pointer.NULL () : unit ptr)
      val x' = _cast(ptr x) : unit ptr
    in
      pthread_create (new_pthread_t_ref (),
                      _NULL,
                      f',
                      x')
    end

val _ = pthreadCreate (print o Int.toString) 1
val _ = pthreadCreate (print o str) #"f"
