package com.shuxin.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.result.Tree;
import com.shuxin.commons.result.ZtreeNode;
import com.shuxin.commons.shiro.ShiroUser;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.TreeNoteUtil;
import com.shuxin.model.Menu;
import com.shuxin.service.IMenuService;

/**
 * @description：资源管理
 */
@Controller
@RequestMapping("/resource")
public class MenuController extends BaseController {

    private Logger logger = LogManager.getLogger(getClass());

    @Autowired
    private IMenuService menuService;

    /**
     * 菜单树
     *
     * @return
     */
    @PostMapping("/tree")
    @ResponseBody
    public Object tree(HttpSession httpSession) {
        ShiroUser shiroUser = getShiroUser();
        List<Tree> treeList = null;
        if (httpSession.getAttribute("tree") == null) {
            treeList = menuService.selectTree(shiroUser);
            httpSession.setAttribute("tree", treeList);
        } else {
            treeList = (List<Tree>) httpSession.getAttribute("tree");
        }

        return treeList;
    }

    /**
     * 资源管理页
     *
     * @return
     */

    @RequiresPermissions("/resource/manager")
    @GetMapping("/manager")
    public String manager() {
        return "admin/resource";
    }

    /**
     * 资源管理列表
     *
     * @return
     */
    @PostMapping("/treeGrid")
    @ResponseBody
    public Object treeGrid() {
        // User asd = ShiroHelper.getCurrentUser();
        return menuService.selectAll();
    }

    /**
     * 查找三级菜单
     */
    @GetMapping("/threefunc")
    public String threefunc(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

        int id = Integer.parseInt(request.getParameter("id"));
        // int pagenum = Integer.parseInt(request.getParameter(page))) ;
        PageInfo pageInfo = new PageInfo(1, 10, "order_seq", "asc");
        /*
         * Map<String, Object> condition = new HashMap<String, Object>();
         * condition.put("p_id",id);
         * pageInfo.setCondition(condition);
         */
        menuService.selectTreeByCondition(pageInfo, id);
        List<Menu> threeMenu = pageInfo.getRows();
        model.addAttribute("page", threeMenu);

        return "findThreefunc";
    }

    /**
     * 添加资源页
     *
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "admin/resourceAdd";
    }

    /**
     * 添加资源
     *
     * @param resource
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public Object add(Menu menu) {

        menuService.insert(menu);
        insertOperationLog(getShiroUser().getLoginName(), "add", "T_MENU", menu.toString());
        return renderSuccess("添加成功！");
    }

    /**
     * 查询所有的菜单
     */
    @RequestMapping("/allTree")
    @ResponseBody
    public Object allMenu() {
        return menuService.selectAllMenu();
    }

    /**
     * 查询所有的资源tree
     */
    @RequestMapping("/allTrees")
    @ResponseBody
    public Object allTree() {
        return menuService.selectAllTree();
    }

    /**
     * 查询所有的资源tree
     */
    @RequestMapping("/allMenuTree")
    @ResponseBody
    public Object allMenuTree(@RequestParam("roleId") String roleId) {

        /* List<Object[]> list = new ArrayList<Object[]>(); */
        List<Menu> list = new ArrayList<Menu>();

        List<ZtreeNode> menuTreelist = new ArrayList<ZtreeNode>();
        // 用于把接收到的数据改造成EasyUI tree认识的数据格式*/
        List<ZtreeNode> menuTrees = new ArrayList<ZtreeNode>();

        try {

            list = menuService.selectUserRoleMenuList(roleId);
            for (int i = 0; i < list.size(); i++) {

                ZtreeNode ztreeNode = new ZtreeNode();

                ztreeNode.setId(list.get(i).getId());

                ztreeNode.setPid(list.get(i).getPid());

                ztreeNode.setName(list.get(i).getName());

                if (list.get(i).getOpenMode() != null) {
                    ztreeNode.setChecked(true);
                }

                menuTrees.add(ztreeNode);
            }
            // TreeNoteUtil为工具类，用于改造数据
            menuTreelist = TreeNoteUtil.getFatherNode(menuTrees);

        } catch (Exception e) {
            logger.error("MenuTreeController.selectMenuTrees() error:" + e.toString());
        }

        return menuTreelist;

    }

    /**
     * 编辑资源页
     *
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/editPage")
    public String editPage(Model model, String id) {
        Menu menu = menuService.selectById(id);
        model.addAttribute("menu", menu);
        return "admin/resourceEdit";
    }

    /**
     * 编辑资源
     *
     * @param resource
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(Menu menu) {

        menuService.updateById(menu);
        insertOperationLog(getShiroUser().getLoginName(), "update", "T_MENU", menu.toString());
        return renderSuccess("编辑成功！");
    }

    /**
     * 删除资源
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(String id) {
        menuService.deleteById(id);
        insertOperationLog(getShiroUser().getLoginName(), "delete", "T_MENU", id);
        return renderSuccess("删除成功！");
    }

}
