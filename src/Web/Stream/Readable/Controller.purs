module Web.Stream.Readable.Controller where


foreign import newImpl :: forall o. EffectFn4 ReadableStream o Int Int ReadableStreamDefaultController


new :: forall o
     . SubRow o (ReadableSourceOpt pullC)
    => ReadableStream
    -> ReadableSourceR startC o
    -> Int
    -> Int
    -> Effect ReadableStreamDefaultController


foreign import desiredSizeImpl :: EffectFn1 ReadableStreamDefaultController Int

foreign import closeImpl :: EffectFn1 ReadableStreamDefaultController Unit

foreign import enqueueImpl :: EffectFn2 ReadableStreamDefaultController ? Unit

foreign import errorImpl :: EffectFn2 ReadableStreamDefaultController Error Unit
