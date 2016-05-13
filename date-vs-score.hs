
type Date = Int
type Cose = String

data Score = Susi {
                  count :: Int,
                  date  :: Int ,
                  score :: Int ,
                  hit   :: Int ,
                  speed :: Int ,
                  miss  :: Int ,
                  cose  :: Cose
                  }deriving (Show)


allPerser :: String ->[Score]
allPerser inputStr = map perser $
                     map words $
                     lines inputStr

str2date :: String -> Int
str2date (y1:y2:y3:y4:_:m1:m2:_:d1:d2:xs) = read [y1,y2,y3,y4,m1,m2,d1,d2] :: Int
str2date _ = 0


-- "1 2014..1/1 " #=> [1,"2014..1/1",1,1,"h2"]
perser :: [String] -> Score
perser [count,date,score,hit,speed,miss,cose] =
    Susi icount idate iscore ihit ispeed imiss cose
    where
        icount = read count :: Int
        idate  = str2date date
        iscore = read score :: Int
        ihit   = read hit   :: Int
        ispeed = read speed :: Int
        imiss  = read miss  :: Int
perser _ = undefined

outData :: [(Int,Int)] -> IO ()
outData []     = return ()
outData (x:xs) = do
        putStr   $ (\t -> show $ fst t) x
        putStr   " "
        putStrLn $ (\t -> show $ snd t) x
        outData xs

main = do
    inputStr <- fmap lines $ readFile "./temp.res"
    let scores  =  map (perser.words) inputStr
    print scores
    putStr "\n\n"

