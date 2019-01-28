package com.wangsong;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.recipes.cache.*;
import org.apache.curator.framework.recipes.cache.PathChildrenCache.StartMode;
import org.apache.curator.framework.recipes.locks.InterProcessMutex;
import org.apache.curator.utils.CloseableUtils;
import org.apache.zookeeper.CreateMode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

@Service
public class CuratorService {

    @Autowired
    private CuratorFramework curatorFramework;

    ExecutorService pool = Executors.newFixedThreadPool(2);

    public List<String> getChildren(String path) throws Exception {
        return curatorFramework.getChildren().forPath(path);
    }

    public byte[] getData(String path) throws Exception {
        return curatorFramework.getData().forPath(path);
    }

    public String createPERSISTENT(String path, String data1) throws Exception {
        return curatorFramework.create().creatingParentsIfNeeded().withMode(CreateMode.PERSISTENT).// 持久
                forPath(path, data1.getBytes());
    }

    public String createPERSISTENT_SEQUENTIAL(String path, String data1) throws Exception {
        return curatorFramework.create().creatingParentsIfNeeded().withMode(CreateMode.PERSISTENT_SEQUENTIAL).// 持久
                forPath(path, data1.getBytes());
    }

    public String createEPHEMERAL(String path, String data1) throws Exception {
        return curatorFramework.create().creatingParentsIfNeeded().withMode(CreateMode.EPHEMERAL).// 临时
                forPath(path, data1.getBytes());
    }

    public String createEPHEMERAL_SEQUENTIAL(String path, String data1) throws Exception {
        return curatorFramework.create().creatingParentsIfNeeded().withMode(CreateMode.EPHEMERAL_SEQUENTIAL).// 临时
                forPath(path, data1.getBytes());
    }

    public void delete(String path) throws Exception {
        curatorFramework.inTransaction().delete().forPath(path).and().commit();// 事务
    }

    public void setData(String path, String data1) throws Exception {
        curatorFramework.setData().forPath(path, data1.getBytes());
    }

    public InterProcessMutex acquire(String path) throws Exception {
        // 4 分布式锁
        InterProcessMutex lock = new InterProcessMutex(curatorFramework, path);
        lock.acquire();
        return lock;

    }

    public void release(InterProcessMutex lock) throws Exception {
        // 释放
        if (lock.isAcquiredInThisProcess()) {
            lock.release();
        }

    }

    public void NodeCache(String path) throws Exception {

        /**
         * 监听数据节点的变化情况
         */
        final NodeCache nodeCache = new NodeCache(curatorFramework, path, false);
        nodeCache.start(true);
        nodeCache.getListenable().addListener(new NodeCacheListener() {
            @Override
            public void nodeChanged() throws Exception {
                System.out
                        .println("Node data is changed, new data: " + new String(nodeCache.getCurrentData().getData()));
            }
        }, pool);
    }

    public void PathChildrenCache(String path) throws Exception {
        /**
         * 监听子节点的变化情况
         */
        final PathChildrenCache childrenCache = new PathChildrenCache(curatorFramework, path, true);
        childrenCache.start(StartMode.POST_INITIALIZED_EVENT);
        childrenCache.getListenable().addListener(new PathChildrenCacheListener() {
            @Override
            public void childEvent(CuratorFramework client, PathChildrenCacheEvent event) throws Exception {
                switch (event.getType()) {
                    case CHILD_ADDED:
                        System.out.println("CHILD_ADDED: " + event.getData().getPath());
                        break;
                    case CHILD_REMOVED:
                        System.out.println("CHILD_REMOVED: " + event.getData().getPath());
                        break;
                    case CHILD_UPDATED:
                        System.out.println("CHILD_UPDATED: " + event.getData().getPath());
                        break;
                    default:
                        break;
                }
            }
        }, pool);
    }

    public static void print(Object result) {
        System.out.println(result instanceof byte[] ? new String((byte[]) result) : result);
    }

}