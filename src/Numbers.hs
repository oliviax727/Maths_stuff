module Numbers where

import Data.NumberLength (numberLength)
import Data.Ratio ((%))
import GHC.Real (Ratio(..))

newtype Z = Z Integer

newtype Q = Q Rational

data R = R Integer Integer Integer deriving (Show, Read)

constructFromCyclic :: Integer -> Rational
constructFromCyclic x = x % ((10 ^ numberLength x) - 1)

constructDecimal :: Integer -> Rational
constructDecimal x = x % (10 ^ numberLength x)

instance Eq R where
    (==) (R an ad ar) (R bn bd br) = (an == bn) && (abs ad == abs bd) && (abs ar == abs br)

instance Ord R where
    compare (R an ad ar) (R bn bd br)
      | an /= bn = compare an bn
      | abs ad /= abs bd = compare (constructDecimal ad) (constructDecimal bd)
      | otherwise = compare (constructDecimal ar) (constructDecimal br)

instance Real R where
    toRational (R n d r) = toRational n + constructDecimal d + constructFromCyclic r

-- instance Fractional R where
--    (/) (R an ad ar) (R bn bd br) =

carryThrough :: Num n => (n -> n -> n) -> (Integer -> Integer) -> (Integer -> Integer)
carryThrough f a b = if numberLength (f a b) > max (numberLength a) (numberLength b) then 1

instance Num R where
  (+) (R an ad ar) (R bn bd br) = R (an + bn) (ad + bd) (ar + br) -- FIXME
  (*) (R an ad ar) (R bn bd br) = R (an * bn) (ad * bd) (ar * br) -- FIXME
  abs (R n d r) = R (-n) d r
  signum (R n d r) = R (signum n) d r
  fromInteger x = R x 0 0
  negate (R n d r) = R (-n) d r


-- data Scalar a = Z Integer | Q Rational | R Float
