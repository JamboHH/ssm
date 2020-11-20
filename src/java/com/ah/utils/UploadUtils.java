package com.ah.utils;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.CannedAccessControlList;
import com.aliyun.oss.model.CreateBucketRequest;
import com.aliyun.oss.model.ObjectMetadata;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

public class UploadUtils {
    public String uploadImage(MultipartFile file) {
        //你的endpoint
        String endpoint = "oss-cn-beijing.aliyuncs.com";
        //阿里云可以获取到
        String accesskeyId = "LTAI4GEqZhGmKgXxD2TtYQRQ";
        //阿里云可以获取到
        String accesskeySecret = "A2jh1jgc35qfRxYQfhZvbLqMOQyIZr";
        //桶的名称  你在运行的时候有可能会报这个桶的名称已经被使用的错误这时候只需要换个没人使用过的名称就可以了
        String buketName = "jambo";
        //这个名称是你存储到oos上的图片名称
        String fileName = UUID.randomUUID().toString() + ".jpg";
        try {
            //创建上传oss客户端
            OSS ossClient = new OSSClientBuilder().build(endpoint, accesskeyId, accesskeySecret);
            InputStream inputStream = file.getInputStream();
            ObjectMetadata objectMetadata = new ObjectMetadata();
            //设置图片格式
            objectMetadata.setContentType("image/jpg");
            //创建桶
            CreateBucketRequest createBucketRequest = new CreateBucketRequest(null); //这个桶的名称可以为空后面设置
            //设置桶的名称
            createBucketRequest.setBucketName(buketName);
            //设置桶的权限。我这里设置的公共读，这样就可以通过连接访问图片
            createBucketRequest.setCannedACL(CannedAccessControlList.PublicRead);
            //将桶设置到OSS
            ossClient.createBucket(createBucketRequest);
            //上传图片至oos
            ossClient.putObject(buketName, fileName, inputStream, objectMetadata);
            //关闭连接
            ossClient.shutdown();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //可以访问的图片连接
        return "https://" + buketName + "." + endpoint + "/" + fileName;
    }
}
