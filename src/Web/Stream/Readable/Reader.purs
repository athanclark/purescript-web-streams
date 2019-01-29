module Web.Streams.Readable.Reader where





foreign import newImpl :: EffectFn1 ReadableStream ReadableStreamDefaultReader

foreign import closedImpl :: ReadableStreamDefaultReader -> Promise Unit

foreign import cancelImpl :: Fn2 ReadableStreamDefaultReader String (Promise Unit)

foreign import readImpl :: ReadableStreamDefaultReader -> Promise { value :: Undefinable ?, done :: Boolean }

foreign import releaseLockImpl :: EffectFn1 ReadableStreamDefaultReader Unit
