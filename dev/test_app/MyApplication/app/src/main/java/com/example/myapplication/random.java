package com.example.myapplication;
import android.annotation.SuppressLint;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;

public class random {

    @SuppressLint({"SetWorldWritable", "SetWorldReadable","SdCardPath"})
    public static void patcher() throws IOException {

        final File file = new File("/data/data/com.facebook.work/lib-compressed/libxplat_fizz_client_protocolAndroid.so");
        file.setReadable(true, false);
        file.setWritable(true, false);
        RandomAccessFile raf = new RandomAccessFile("/data/data/com.facebook.work/lib-compressed/libxplat_fizz_client_protocolAndroid.so", "rw");
        raf.seek(0x1d9f0);
        raf.write(0x07);
        raf.write(0x00);
        raf.write(0x00);
        raf.write(0x14);
        raf.close();
    }

}
