package org.haskell;

import android.app.Activity;
import android.os.Bundle;

public class HaskellActivity extends Activity
{
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        onCreateHS(savedInstanceState);
    }

    public native void onCreateHS(Bundle savedInstanceState);
    static { System.loadLibrary("haskell"); }
}
