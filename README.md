android-haskell-activity
========================


An example of an Android Activity written in Haskell.

Before building this example Android App you will need a working
Android cross-compiler for arm and x86.

You can build working cross-compilers with the ghc-android built tool
at https://github.com/neurocyte/ghc-android. Follow the instructions
there and build both arm and x86 variants. If you want to just build
this example App for arm or x86 you will need to edit custom_rules.xml
and jni/Application.mk.

Once you have a working compiler you will also need to install the
foreign-jni package from https://github.com/neurocyte/foreign-jni and
any dependencies it requires. To do so, use the cabal wrapper that
came with your cross-compiler. For example run

     arm-linux-androideabi-cabal install

and

     i686-linux-android-cabal install

in the foreign-jni working tree root.

Once you have all the correct dependencies installed you can build
android-haskell-activity with:

     ant debug

or

     ant release

and install and run it on a real device.

Have a lot of fun!