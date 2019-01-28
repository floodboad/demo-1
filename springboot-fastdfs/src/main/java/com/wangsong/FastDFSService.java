package com.wangsong;

import org.apache.commons.lang3.StringUtils;
import org.csource.common.MyException;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.*;
import org.springframework.stereotype.Service;

import java.io.*;

@Service
public class FastDFSService {
    
    FastDFSService() throws IOException, MyException {
        ClientGlobal.init("fdfs_client.conf");
    }

    public static void main(String[] args) throws FileNotFoundException, IOException {
        for (int i = 0; i < 1000; i++) {
			/*
			File f=new File(local_filename);
			String groupName= upload(File2byte(f),f.getName());
		    System.out.println(groupName);
		    IOUtils.write(download(groupName), new FileOutputStream("D:/app/fastdfs/"+getFileName(groupName)));
			System.out.println(getFileInfo(groupName));
			System.out.println(getFileMate(groupName));
			System.out.println( delete(groupName)==0 ? "删除成功" : "删除失败"); 
			*/
        }

    }


    public String upload(byte[] bs, String stringbe) {
        TrackerServer trackerServer = null;
        StorageServer storageServer = null;
        String fileIds = null;
        try {
            trackerServer = init();
            StorageClient1 storageClient = new StorageClient1(trackerServer, storageServer);
            fileIds = storageClient.upload_file1(bs, getFileExt(stringbe), null);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (MyException e) {
            e.printStackTrace();
        } finally {
            close(storageServer, trackerServer);
        }
        return fileIds;
    }

    public byte[] download(String groupName) {
        TrackerServer trackerServer = null;
        StorageServer storageServer = null;
        byte[] b = null;
        try {
            trackerServer = init();
            StorageClient1 storageClient1 = new StorageClient1(trackerServer, storageServer);
            b = storageClient1.download_file1(groupName);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(storageServer, trackerServer);
        }
        return b;
    }

    public FileInfo getFileInfo(String groupName) {
        TrackerServer trackerServer = null;
        StorageServer storageServer = null;
        FileInfo fi = null;
        try {
            trackerServer = init();
            StorageClient1 storageClient1 = new StorageClient1(trackerServer, storageServer);
            fi = storageClient1.get_file_info1(groupName);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(storageServer, trackerServer);
        }
        return fi;
    }

    public NameValuePair[] getFileMate(String groupName) {
        TrackerServer trackerServer = null;
        StorageServer storageServer = null;
        NameValuePair nvps[] = null;
        try {
            trackerServer = init();
            StorageClient1 storageClient1 = new StorageClient1(trackerServer, storageServer);
            nvps = storageClient1.get_metadata1(groupName);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(storageServer, trackerServer);
        }
        return nvps;
    }

    public int delete(String groupName) {
        TrackerServer trackerServer = null;
        StorageServer storageServer = null;
        int i = 0;
        try {
            trackerServer = init();
            StorageClient1 storageClient1 = new StorageClient1(trackerServer, storageServer);
            i = storageClient1.delete_file1(groupName);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(storageServer, trackerServer);
        }
        return i;
    }

    public byte[] File2byte(File file) {
        byte[] buffer = null;
        try {
            FileInputStream fis = new FileInputStream(file);
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] b = new byte[1024];
            int n;
            while ((n = fis.read(b)) != -1) {
                bos.write(b, 0, n);
            }
            fis.close();
            bos.close();
            buffer = bos.toByteArray();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return buffer;
    }

    private TrackerServer init() {
        TrackerServer trackerServer = null;
        try {
            TrackerClient tracker = new TrackerClient();
            trackerServer = tracker.getConnection();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return trackerServer;
    }

    private void close(StorageServer storageServer, TrackerServer trackerServer) {
        try {
            if (storageServer != null) {
                storageServer.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            if (trackerServer != null) {
                trackerServer.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private String getFileExt(String fileName) {
        if (StringUtils.isBlank(fileName) || !fileName.contains(".")) {
            return "";
        } else {
            return fileName.substring(fileName.lastIndexOf(".") + 1); // 不带最后的点

        }
    }

    private String getFileName(String fileName) {
        if (StringUtils.isBlank(fileName) || !fileName.contains("/")) {
            return "";
        } else {
            return fileName.substring(fileName.lastIndexOf("/") + 1); // 不带最后的点

        }
    }
}
