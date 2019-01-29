module Web.Stream.Writable.Writer where


foreign import newImpl :: EffectFn1 WritableStream WritableStreamDefaultWriter

foreign import closedImpl :: WritableStreamDefaultWriter -> Promise Unit

foreign import desiredSizeImpl :: EffectFn1 WritableStreamDefaultWriter (Nullable Int)

foreign import readyImpl :: WritableStreamDefaultWriter -> Promise Unit

foreign import abortImpl :: Fn2 WritableStreamDefaultWriter String (Promise Unit)

foreign import closeImpl :: WritableStreamDefaultWriter -> Promise Unit

foreign import releaseLockImpl :: EffectFn1 WritableStreamDefaultWriter Unit

foreign import writeImpl :: Fn2 WritableStreamDefaultWriter ? (Promise Unit)
