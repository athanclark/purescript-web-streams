module Web.Stream.Types where



type QueueingStrategy =
  { highWaterMark :: Int
  , size :: EffectFn1 ArrayBuffer Int
  }

foreign import data ReadableStream :: Type

foreign import data ReadableStreamDefaultReader :: Type

foreign import data ReadableStreamDefaultController :: Type

foreign import data WritableStream :: Type

foreign import data WritableStreamDefaultWriter :: Type

foreign import data WritableStreamDefaultController :: Type


foreign import data UnderlyingParam :: Type

underlyingParamFromPromise :: Promise Unit -> UnderlyingParam

underlyingParamFromUnit :: Unit -> UnderlyingParam
