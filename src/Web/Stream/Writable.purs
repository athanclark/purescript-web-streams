module Web.Stream.Writable where




type WritableSinkOpt c =
  ( start :: EffectFn1 c UnderlyingParam
  , write :: EffectFn2 ? c UnderlyingParam
  , close :: EffectFn1 c UnderlyingParam
  , abort :: EffectFn1 String UnderlyingParam
  )


foreign import newImpl :: forall o. EffectFn2 o (Nullable QueueingStrategy) WritableStream


new :: forall o c
     . SubRow o (WritableSinkOpt c)
    => { | o }
    -> Maybe QueueingStrategy
    -> Effect WritableStream


foreign import lockedImpl :: EffectFn1 WritableStream Boolean

foreign import abortImpl :: Fn2 WritableStream String (Promise Unit)

foreign import getWriterImpl :: forall o. Fn1 WritableStream o

getWriter :: WritableStream -> WritableStreamDefaultWriter
