module Web.Stream.Readable where




type ReadableSourceR (c :: Type -> Type) a o =
  { start :: EffectFn1 (c a) UnderlyingParam
  | o }

newtype ReadableSourceType = ReadableSourceType String

bytes :: ReadableSourceType
bytes = ReadableSourceType "bytes"


type ReadableSourceOpt (c :: Type -> Type) a =
  ( push :: EffectFn1 (c a) UnderlyingParam
  , cancel :: EffectFn1 String UnderlyingParam
  , "type" :: ReadableSourceType
  , autoAllocateChunkSize :: Int
  )


foreign import newImpl :: forall o a. EffectFn2 o (Nullable QueueingStrategy) (ReadableStream a)


new :: forall o c a
     . SubRow o (ReadableSourceOpt c a)
    => ReadableSourceR c a o
    -> Maybe QueueingStrategy
    -> Effect (ReadableStream a)
new x s = runEffectFn2 newImpl x (toNullable s)

foreign import lockedImpl :: forall a. EffectFn1 (ReadableStream a) Boolean

locked :: forall a. ReadableStream a -> Effect Boolean
locked = runEffectFn1 lockedImpl

foreign import cancelImpl :: forall a. Fn2 (ReadableStream a) String (Promise Unit)

cancel :: forall a. ReadableStream a -> String -> Aff Unit
cancel x s = toAff (runFn2 cancelImpl x s)

type PipeToOpts =
  { preventClose :: Boolean
  , preventAbort :: Boolean
  , preventCancel :: Boolean
  }

foreign import pipeToImpl :: forall a. Fn3 (ReadableStream a) (WritableStream a) (Nullable PipeToOpts) (Promise Unit)

pipeTo :: forall a. ReadableStream a -> WritableStream a -> Maybe PipeToOpts -> Aff Unit
pipeTo x y z = toAff (runFn3 pipeToImpl x y (toNullable z))

foreign import teeImpl :: forall a. ReadableStream a -> T2 (ReadableStream a) (ReadableStream a)

tee :: forall a. ReadableStream a -> Tuple (ReadableStream a) (ReadableStream a)
tee x =
  let y = teeImpl x
  in  Tuple (prj y d0) (prj y d1)


newtype ReaderMode = ReaderMode String

byob :: ReaderMode
byob = ReaderMode "byob"

undefined :: ReaderMode
undefined = ReaderMode "undefined"


foreign import getReaderImpl :: forall o a. Fn2 (ReadableStream a) {mode :: ReaderMode} o

getReader :: forall a. ReadableStream a -> ReadableStreamDefaultReader a
getReader x = runFn2 getReaderImpl x {mode: byob}

-- getReaderBin :: ReadableStream ArrayBuffer -> ReadableStreamBYOBReader
-- getReaderBin x = runFn2 getReaderImpl x {mode: undefined}

