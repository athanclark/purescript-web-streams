module Web.Stream.Writable.Controller where


foreign import newImpl :: forall o. EffectFn4 WritableStream o Int Int WritableStreamDefaultController

foreign import errorImpl :: EffectFn2 WritableStreamDefaultController String Unit
