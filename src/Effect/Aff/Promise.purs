module Effect.Aff.Promise where

import Prelude ((<<<))
import Data.Either (Either (..), either)
import Effect.Promise (Promise, runPromise, promise)
import Effect.Aff (Aff, runAff_, makeAff)



toAff :: forall a. Promise a -> Aff a
toAff p = makeAff \resolve -> nonCanceler <$ runPromise (resolve <<< Right) (resolve <<< Left) p

fromAff :: forall a. Aff a -> Promise a
fromAff x = promise \ok bad -> runAff_ (either bad ok) x
