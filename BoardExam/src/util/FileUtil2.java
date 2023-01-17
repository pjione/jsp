package util;

import java.io.*;

public class FileUtil2 {
	public static void saveImage(String root, String fbname, byte[] data) throws IOException {
		root += "/images";
		File f = new File(root);
		if(!f.exists()) f.mkdir();
		f = new File(root + "/" + fbname);
		FileOutputStream out = new FileOutputStream(f);
		out.write(data);
		out.close();
		
	}
}
