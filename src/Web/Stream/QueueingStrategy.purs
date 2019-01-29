module Web.Stream.QueueingStrategy where


foreign import newCountImpl :: EffectFn1 {highWaterMark :: Int} QueueingStrategy

foreign import newByteLengthImpl :: EffectFn1 {highWaterMark :: Int} QueueingStrategy
