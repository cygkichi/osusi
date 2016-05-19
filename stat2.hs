-- Version 2.00

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


sma :: Int -> [Int] -> [Int]
sma n is
    | length is < n = []
    | otherwise     = (flip div n $ sum $ take n is)
                    : (sma n $ tail is)

wma :: Int -> [Int] -> [Int]
wma n is
    | length is < n = []
    | otherwise     = (flip div (sum [1..n]) $ sum $ zipWith (*) [1..n] is)
                    : (wma n $ tail is)


out2Tuples :: [(Int,Int)] -> IO ()
out2Tuples []     = return ()
out2Tuples (x:xs) = do
           putStr   $ (\t -> show $ fst t) x
           putStr   " "
           putStrLn $ (\t -> show $ snd t) x
           out2Tuples xs

mNum :: Int
mNum = 30

main = do
    inputStr <- fmap lines $ readFile "./temp.res"
    let scores  = map (perser.words) inputStr
    let h3scores  = map (\s -> (count s,score s)) $ filter (\s -> cose s == "h3" ) scores
    let h5scores  = map (\s -> (count s,score s)) $ filter (\s -> cose s == "h5" ) scores
    let h10scores = map (\s -> (count s,score s)) $ filter (\s -> cose s == "h10" ) scores
    out2Tuples h3scores
    putStr "\n\n"
    out2Tuples h5scores
    putStr "\n\n"
    out2Tuples h10scores
    putStr "\n\n"
    out2Tuples $ zip (wma mNum $ map fst h3scores) (wma mNum $ map snd h3scores)
    putStr "\n\n"
    out2Tuples $ zip (wma mNum $ map fst h5scores) (wma mNum $ map snd h5scores)
    putStr "\n\n"
    out2Tuples $ zip (wma mNum $ map fst h10scores) (wma mNum $ map snd h10scores)
    putStr "\n\n"

