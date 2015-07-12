package cn.jxufe.core.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.util.AntPathMatcher;

import cn.jxufe.core.dao.BaseDao;
import cn.jxufe.core.web.domain.Resource;

/**
 * 
* 类名称：MyFilterInvocationSecurityMetadataSource   
* 类描述： 
* 创建人：Jxufe HeHaiYang
* 创建时间：2015-2-14 下午03:53:24     
* 修改备注：   
* @version
 */
public class MyFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {
    
    protected Logger logger = LoggerFactory.getLogger(getClass());
    
    private AntPathMatcher urlMatcher = new AntPathMatcher();  
    
    private static Map<String, Collection<ConfigAttribute>> resourceMap = null;
      
    private BaseDao baseDao;
    
    public BaseDao getBaseDao() {
        return baseDao;
    }

    public void setBaseDao(BaseDao baseDao) {
        this.baseDao = baseDao;
    }
    
    //由spring调用
    public MyFilterInvocationSecurityMetadataSource(BaseDao baseDao) {
        this.baseDao=baseDao;
        loadResourceDefine();
    }
    
    //加载所有资源
    private void loadResourceDefine() {
        logger.debug("容器启动(MySecurityMetadataSource：loadResourceDefine)");
        logger.debug("--------------开始加载系统资源与权限列表数据--------------");  
           resourceMap = new HashMap<String,Collection<ConfigAttribute>>(); 
           String sql="select * from t_system_resource_info";
                List<Resource> resources = this.baseDao.findListBeanByArray(sql, Resource.class);
                for(Resource resource : resources){
                    Collection<ConfigAttribute> configAttributes = null;  
                    ConfigAttribute configAttribute = new SecurityConfig(resource.getName());  
                    if(resourceMap.containsKey(resource.getPath())){  
                        configAttributes = resourceMap.get(resource.getPath());  
                        configAttributes.add(configAttribute);  
                    }else{  
                        configAttributes = new ArrayList<ConfigAttribute>() ;  
                        configAttributes.add(configAttribute);  
                        resourceMap.put(resource.getPath(), configAttributes);  
                    }  
                }  
                logger.debug("--------------系统资源与权限列表数据加载结束--------------");  
    }
    
    /**
     *  根据请求的资源地址，获取它所拥有的权限 
     */
    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
         //获取请求的url地址  
        String requestUrl = ((FilterInvocation) object).getRequestUrl();
        logger.debug("--------------取得请求资源所需权限(MySecurityMetadataSource:getAttributes)--------------");
        logger.debug("--------------请求地址为："+requestUrl+"--------------");  
        Iterator<String> it = resourceMap.keySet().iterator();  
            while(it.hasNext()){
                String _url = it.next();  
                if(_url.indexOf("?")!=-1){  
                    _url = _url.substring(0, _url.indexOf("?"));  
                }  
                if(urlMatcher.match(_url,requestUrl))  
                    return resourceMap.get(_url);  
            }
            
            /**
             * 如果是想做到没配的资源默认可以访问的话，那么就返回空或者NULL
             * 此时报404错误！
             */
            return null; 
            
            /**
             * 使用下面的写法代替return null;没配的资源则不可以访问，建议开发的时候还是用上面
             * 此时报无访问权限提示！
             */
//            Collection<ConfigAttribute> returnCollection = new ArrayList<ConfigAttribute>();
//            returnCollection.add(new SecurityConfig("NO_RES")); 
//            return returnCollection;
    }
    
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        Set<ConfigAttribute> allAttributes = new HashSet<ConfigAttribute>();
        for (Entry<String, Collection<ConfigAttribute>> entry : resourceMap.entrySet()) {
            allAttributes.addAll(entry.getValue());
        }
        logger.debug(allAttributes.toString());
        return allAttributes;
    }
    
    public Collection<ConfigAttribute> getConfigAttributes(String...value) {
        return SecurityConfig.createList(value);
    }
    
    public boolean supports(Class<?> clazz) {
        return true;
    }

}