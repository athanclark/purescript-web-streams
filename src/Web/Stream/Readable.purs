module Web.Stream.Readable where




type ReadableSourceR c o =
  { start :: EffectFn1 c UnderlyingParam
  | o }

newtype ReadableSourceType = ReadableSourceType String

bytes :: ReadableSourceType
bytes = ReadableSourceType "bytes"


type ReadableSourceOpt c =
  ( push :: EffectFn1 c UnderlyingParam
  , cancel :: EffectFn1 String UnderlyingParam
  , "type" :: ReadableSourceType
  , autoAllocateChunkSize :: Int
  )


foreign import newImpl :: forall o. EffectFn2 o (Nullable QueueingStrategy) ReadableStream


new :: forall o c
     . SubRow o (ReadableSourceOpt c)
    => ReadableSourceR c o
    -> Maybe QueueingStrategy
    -> Effect ReadableStream

foreign import lockedImpl :: EffectFn1 ReadableStream Boolean

foreign import cancelImpl :: Fn2 ReadableStream String (Promise Unit)

type PipeToOpts =
  { preventClose :: Boolean
  , preventAbort :: Boolean
  , preventCancel :: Boolean
  }

foreign import pipeToImpl :: Fn3 ReadableStream WritableStream (Nullable PipeToOpts) (Promise Unit)

foreign import teeImpl :: ReadableStream -> T2 ReadableStream ReadableStream

newtype ReaderMode = ReaderMode String

byob :: ReaderMode
byob = ReaderMode "byob"

undefined :: ReaderMode
undefined = ReaderMode "undefined"


foreign import getReaderImpl :: forall o. Fn2 ReadableStream {mode :: ReaderMode} o

getReader :: ReadableStream -> ReadableStreamDefaultReader

getReaderBin :: ReadableStream -> ReadableStreamBYOBReader

