
type Date = String
type Cose = String

data Score = Susi {
                  count :: Int,
                  date  :: Date ,
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

-- "1 2014..1/1 " #=> [1,"2014..1/1",1,1,"h2"]
perser :: [String] -> Score
perser [count,date,score,hit,speed,miss,cose] =
    Susi icount date iscore ihit ispeed imiss cose
    where
        icount = read count :: Int
        iscore = read score :: Int
        ihit   = read hit   :: Int
        ispeed = read speed :: Int
        imiss  = read miss  :: Int
perser _ = undefined

testData :: [(Int,Int)]
testData = [(1,20),(2,30),(4,40),(5,50),(7,20)]

movingAve :: Int -> [(Int,Int)] -> [(Int,Int)]
movingAve n is
    | length is < n = []
    | otherwise     = (fstAve,sndAve): movingAve n (drop 1 is)
    where
    headDate = take n is
    fstAve   = flip div n $ sum $ map fst headDate
    sndAve   = flip div n $ sum $ map snd headDate


moveAverage :: Cose -> Int -> [Score] -> [(Int,Int)]
moveAverage c n ss = mAve n $
                     map (\s -> (count s,score s)) $
                     filter (\s -> cose s == c) ss
  where
    mAve :: Int -> [(Int,Int)] -> [(Int,Int)]
    mAve n iis
      | length iis < n = []
      | otherwise      = (fAve,sAve):(mAve n $ drop n iis)
        where
          fAve = flip div n $ sum $ map fst $ take n iis
          sAve = flip div n $ sum $ map snd $ take n iis

outData :: [(Int,Int)] -> IO ()
outData []     = return ()
outData (x:xs) = do
        putStr   $ (\t -> show $ fst t) x
        putStr   " "
        putStrLn $ (\t -> show $ snd t) x
        outData xs

mNum :: Int
mNum = 25

main = do
    inputStr <- fmap lines $ readFile "./temp.res"
    let scores  =  map (perser.words) inputStr
    outData $ map (\s -> (count s, score s)) $ filter (\s -> cose s == "h3") scores
    putStr "\n\n"
    outData $ map (\s -> (count s, score s)) $ filter (\s -> cose s == "h5") scores
    putStr "\n\n"
    outData $ map (\s -> (count s, score s)) $ filter (\s -> cose s == "h10") scores
    putStr "\n\n"
    outData $ map (\s -> (count s, score s)) $ filter (\s -> cose s == "s3") scores
    putStr "\n\n"
    outData $ map (\s -> (count s, score s)) $ filter (\s -> cose s == "s5") scores
    putStr "\n\n"
    outData $ map (\s -> (count s, score s)) $ filter (\s -> cose s == "s10") scores
    putStr "\n\n"
    outData $ movingAve mNum $ map (\s -> (count s, score s)) $ filter (\s -> cose s == "h3") scores
    putStr "\n\n"
    outData $ movingAve mNum $ map (\s -> (count s, score s)) $ filter (\s -> cose s == "h5") scores
    putStr "\n\n"
    outData $ movingAve mNum $ map (\s -> (count s, score s)) $ filter (\s -> cose s == "h10") scores
    putStr "\n\n"
    outData $ movingAve mNum $ map (\s -> (count s, score s)) $ filter (\s -> cose s == "s3") scores
    putStr "\n\n"
    outData $ movingAve mNum $ map (\s -> (count s, score s)) $ filter (\s -> cose s == "s5") scores
    putStr "\n\n"
    outData $ movingAve mNum $ map (\s -> (count s, score s)) $ filter (\s -> cose s == "s10") scores
    putStr "\n\n"

