package com.shuxin.commons.result;

import java.util.List;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

public class ZtreeNode {
    
    //节点的唯一标识 tId。
    private String id;

    //pid
    private String pid;
    //节点名称。
    private String name;
    // 节点的 展开 / 折叠 状态。 默认false
    private boolean open = true;
    
    private List<ZtreeNode> children;
    

    private boolean checked;

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    public void setChildren(List<ZtreeNode> children) {
        this.children = children;
    }
    public List<ZtreeNode> getChildren() {
        return children;
    }
    
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }
    public void setPid(String pid) {
        this.pid = pid;
    }
   
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public boolean isOpen() {
        return open;
    }
    public void setOpen(boolean open) {
        this.open = open;
    }

   
    public boolean isChecked() {
        return checked;
    }
    public void setChecked(boolean checked) {
        this.checked = checked;
    }
    
    

}
