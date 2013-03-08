{-# LANGUAGE ForeignFunctionInterface,OverloadedStrings #-}
module HaskellActivity where

import Foreign.JNI
import Foreign.JNI.Lookup
import Control.Monad.IO.Class
import Data.Text (Text, append, pack)
import GHC.Conc

textView_class :: JClass
textView_class = jclass "android/widget/TextView"

textView_new :: JObject -> JNI JObject
textView_new ctx = do
  newObject textView_class (jmethodid textView_class "<init>" "(Landroid/content/Context;)V") [jv ctx]

textView_setText :: JObject -> Text -> JNI ()
textView_setText tv txt = do
  jtxt <- newString txt
  callMethod tv (jmethodid textView_class "setText" "(Ljava/lang/CharSequence;)V") [jv jtxt]

onCreate :: JNIEnv -> JObject -> JObject -> IO ()
onCreate env activity _bundle = runJNISafe () env $ do
  msg <- liftIO $ do
    getNumProcessors >>= setNumCapabilities
    caps <- getNumCapabilities
    return $ "Hello World!\nRunning on " `append` pack (show caps) `append` " CPUs!"

  activityClass <- getObjectClass activity
  tv <- textView_new activity
  textView_setText tv msg

  activity_setContentView <- getMethodID activityClass "setContentView" "(Landroid/view/View;)V"
  callMethod activity activity_setContentView [JVObject tv] :: JNI ()

foreign export ccall
  "Java_org_haskell_HaskellActivity_onCreateHS"
  onCreate :: JNIEnv -> JObject -> JObject -> IO ()
