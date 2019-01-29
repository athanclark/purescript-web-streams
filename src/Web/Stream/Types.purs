module Web.Stream.Types where



type QueueingStrategy =
  { highWaterMark :: Int
  , size :: EffectFn1 ArrayBuffer Int
  }

foreign import data ReadableStream :: Type -> Type

foreign import data ReadableStreamDefaultReader :: Type -> Type

foreign import data ReadableStreamDefaultController :: Type -> Type

foreign import data WritableStream :: Type -> Type

foreign import data WritableStreamDefaultWriter :: Type -> Type

foreign import data WritableStreamDefaultController :: Type -> Type


foreign import data UnderlyingParam :: Type

fromPromise :: Promise Unit -> UnderlyingParam
fromPromise = unsafeCoerce

fromUnit :: Unit -> UnderlyingParam
fromUnit = unsafeCoerce
