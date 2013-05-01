_interface "hello2Impl.smi"

type pthread_t = unit ptr   (* ToDo: system dependent *)
fun new_pthread_t_ref () =  ref (Pointer.NULL () : pthread_t)

val pthread_create =
    _import "pthread_create"
    : (pthread_t ref, unit ptr, unit ptr -> unit ptr, unit ptr) -> int

fun pthreadCreateInt f x =
    let
      val x' = _cast(ref x) : unit ptr
      fun f' (x' : unit ptr) = (f (Pointer.load (_cast (x') : int ptr)); _NULL)
    in
      pthread_create (new_pthread_t_ref (), _NULL, f', x')
    end
fun pthreadCreateWord f x =
    let
      val x' = _cast(ref x) : unit ptr
      fun f' (x' : unit ptr) = (f (Pointer.load (_cast (x') : word ptr)); _NULL)
    in
      pthread_create (new_pthread_t_ref (), _NULL, f', x')
    end
fun pthreadCreateWord8 f x =
    let
      val x' = _cast(ref x) : unit ptr
      fun f' (x' : unit ptr) =
          (f (Pointer.load (_cast (x') : SMLSharp.Word8.word ptr)); _NULL)
    in
      pthread_create (new_pthread_t_ref (), _NULL, f', x')
    end
fun pthreadCreateChar f x =
    let
      val x' = _cast(ref x) : unit ptr
      fun f' (x' : unit ptr) = (f (Pointer.load (_cast (x') : char ptr)); _NULL)
    in
      pthread_create (new_pthread_t_ref (), _NULL, f', x')
    end
fun pthreadCreateReal f x =
    let
      val x' = _cast(ref x) : unit ptr
      fun f' (x' : unit ptr) = (f (Pointer.load (_cast (x') : real ptr)); _NULL)
    in
      pthread_create (new_pthread_t_ref (), _NULL, f', x')
    end
(* fun pthreadCreateReal32 f x = *)
(*     let *)
(*       val x' = _cast(ref x) : unit ptr *)
(*       fun f' (x' : unit ptr) = *)
(*           (f (Pointer.load (_cast (x') : SMLSharp.Real32.real ptr)); _NULL) *)
(*     in *)
(*       pthread_create (new_pthread_t_ref (), _NULL, f', x') *)
(*     end *)
fun pthreadCreatePtr f x =
    let
      val x' = _cast(ref x) : unit ptr
      fun f' (x' : unit ptr) =
          (f (Pointer.load (_cast (x') : 'a ptr ptr)); _NULL)
    in
      pthread_create (new_pthread_t_ref (), _NULL, f', x')
    end
