package com.shuxin.commons.utils;

import java.util.ArrayList;
import java.util.List;

import com.shuxin.commons.result.ZtreeNode;

public class TreeNoteUtil {
    /**
     * 获取父节点菜单
     * @param treesList 所有树菜单集合
     * @return
     */
    public final static List<ZtreeNode> getFatherNode(List<ZtreeNode> treesList) {
        
        List<ZtreeNode> newTrees = new ArrayList<ZtreeNode>();
        
        for (ZtreeNode mt : treesList) {
            if ("1".equals(mt.getPid())) {// 如果pId为空，则该节点为父节点
//            if (StringUtils.isEmpty(mt.getPid())) {// 如果pId为空，则该节点为父节点
            // 递归获取父节点下的子节点
            mt.setChildren(getChildrenNode(mt.getId(), treesList));
            newTrees.add(mt);
            }
        }
    return newTrees;
    }

    /**
     * 递归获取子节点下的子节点
     * @param pId 父节点的ID
     * @param treesList 所有菜单树集合
     * @return
     */
    private final static List<ZtreeNode> getChildrenNode(String pId,
        List<ZtreeNode> treesList) {
    
    List<ZtreeNode> newTrees = new ArrayList<ZtreeNode>();
    
    for (ZtreeNode mt : treesList) {
        
        //无父节点
        if ("1".equals(mt.getPid())) continue;
        //有父节点
        if (mt.getPid().equals(pId)) {
        
        // 递归获取子节点下的子节点，即设置树控件中的children
        mt.setChildren(getChildrenNode(mt.getId(), treesList));
        
        /*// 设置树控件attributes属性的数据
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("url", mt.getUrl());*/
        //mt.setAttributes(map);
        
        newTrees.add(mt);
        }
    }
    return newTrees;
    }
}
