
type Date = String
type Cose = String

data Score = Susi {
                  date  :: Date ,
                  score :: Int ,
                  hit   :: Int ,
                  speed :: Int ,
                  miss  :: Int ,
                  cose  :: Cose
                  }
           | Ety  {
                  date  :: Date,
                  theme :: String,
                  socre :: Int,
                  time  :: Int,
                  hit   :: Int,
                  miss  :: Int,
                  wpm   :: Int,
                  arate :: Int,
                  weak  :: String
                  }deriving(Show)

allPerser :: String ->[Score]
allPerser inputStr = map perser $
                     map words $
                     lines inputStr

perser :: [String] -> Score
perser [date,score,hit,speed,miss,cose] =
    Susi date iscore ihit ispeed imiss cose
    where
        iscore = read score :: Int
        ihit   = read hit   :: Int
        ispeed = read speed :: Int
        imiss  = read miss  :: Int
perser _ = undefined


main = do
     inputStr <- readFile "./res.txt"
     print $ map score$ allPerser inputStr

