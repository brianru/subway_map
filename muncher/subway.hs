import qualified Aws
import qualified Aws.S3 as S3

-- The Muncher
-- 30 second loop 
    -- get json

-- The Cruncher
-- separate thread
    -- parse / extract / export to json
    -- upload file to s3

-- The Luncher
-- move old S3 files into DB

-- process for batching s3 files and inserting into database
simpleHTTP (getRequest "http://www.haskell.org/" >>= fmap (take 100) . getResponseBody

