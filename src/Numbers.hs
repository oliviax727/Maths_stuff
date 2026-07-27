module Numbers where

import Data.NumberLength (numberLength)
import Data.Ratio ((%))
import GHC.Real (Ratio ((:%)))

newtype Z = Z Integer deriving (Eq, Ord, Num, Read)

instance Show Z where
  show :: Z -> String
  show (Z n) = show n

instance Real Z where
  toRational :: Z -> Rational
  toRational (Z n) = n % 1

instance Scalar Z where
  toReal :: Z -> R
  toReal (Z n) = R n 0 0

newtype Q = Q Rational deriving (Eq, Ord, Num, Show, Read, Fractional)

data R = R Integer Integer Integer

constructFromCyclic :: Integer -> Rational
constructFromCyclic x = x % ((10 ^ numberLength x) - 1)

constructDecimal :: Integer -> Rational
constructDecimal x = x % (10 ^ numberLength x)

instance Eq R where
  (==) :: R -> R -> Bool
  (==) (R an ad ar) (R bn bd br) = (an == bn) && (abs ad == abs bd) && (abs ar == abs br)

instance Ord R where
  compare :: R -> R -> Ordering
  compare (R an ad ar) (R bn bd br)
    | an /= bn = compare an bn
    | abs ad /= abs bd = compare (constructDecimal ad) (constructDecimal bd)
    | otherwise = compare (constructDecimal ar) (constructDecimal br)

instance Real R where
  toRational :: R -> Rational
  toRational (R n d r) = toRational n + constructDecimal d + constructFromCyclic r

instance Fractional R where
  fromRational :: Rational -> R
  fromRational (a :% b) = R a b 0 -- FIXME

  (/) :: R -> R -> R
  (/) (R an ad ar) (R bn bd br) = R (an * bn) (ad * bd) (ar * br) -- FIXME

instance Num R where
  (+) :: R -> R -> R
  (+) (R an ad ar) (R bn bd br) = R (an + bn) (ad + bd) (ar + br) -- FIXME

  (*) :: R -> R -> R
  (*) (R an ad ar) (R bn bd br) = R (an * bn) (ad * bd) (ar * br) -- FIXME

  abs :: R -> R
  abs (R n d r) = R (-n) d r

  signum :: R -> R
  signum (R n d r) = R (signum n) d r

  fromInteger :: Integer -> R
  fromInteger x = R x 0 0

  negate :: R -> R
  negate (R n d r) = R (-n) d r

class (Num a, Real a, Ord a, Eq a, Show a, Read a) => Scalar a where
  toReal :: a -> R