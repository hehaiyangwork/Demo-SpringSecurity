package cn.jxufe.core.security.cache;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheException;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

import org.springframework.dao.DataRetrievalFailureException;

import cn.jxufe.web.domain.Authority;
import cn.jxufe.web.domain.Resource;

/**
 * 
* 类名称：SecurityCache   
* 类描述： 权限控制相关缓存
* 创建人：Jxufe HeHaiYang
* 创建时间：2015-2-14 下午11:14:00     
* 修改备注：   
* @version
 */
public class SecurityCache {

	private final static String AUTHORITY_CACHE="authority_cache";
	private final static String AUTHORITY_RESOURCE_CACHE="authority_resource_cache";
	private final static String RESOURCE_CACHE="resource_cache";
	private static Cache authorityCache=CacheManager.getInstance().getCache(AUTHORITY_CACHE);
	private static Cache authorityResourceCache=CacheManager.getInstance().getCache(AUTHORITY_RESOURCE_CACHE);
	private static Cache resourceCache=CacheManager.getInstance().getCache(RESOURCE_CACHE);
	
	//authorityCache========================================================================
	//放入cache
	 public synchronized static void putAuthorityCache(Integer authorityId, Authority authority){
		Element element=new Element(authorityId, authority);
		authorityCache.put(element);
	}
	
	//获取cache
	public synchronized static Authority getAuthorityCache(Integer authorityId){
			Element element = null;
			try {
				element =authorityCache.get(authorityId);
			} catch (CacheException cacheException) {
				throw new DataRetrievalFailureException("AuthorityCache failure: " + cacheException.getMessage(), cacheException);
			}
			if (element == null) {
				return null;
			} else {
				return  (Authority) element.getValue();
			}
		} 
	
	//清空cache
	 public synchronized static void removeAllAuthorityCache(){
		 authorityCache.removeAll();
		 authorityCache.clearStatistics();
		 authorityCache.flush();
	}
	
	//删除cache
	public synchronized static void removeAuthorityCache(Integer authorityId){
		authorityCache.remove(authorityId);
	}
	
	//authorityResourceCache========================================================================
	//放入cache
	 public synchronized static void putAuthorityResourceCache(Integer authorityId, Integer resourceId){
		Element element=new Element(authorityId, resourceId);
		authorityResourceCache.put(element);
	}
	
	//获取cache
	public synchronized static Integer getAuthorityResourceCache(Integer authorityId){
			Element element = null;
			try {
				element =authorityResourceCache.get(authorityId);
			} catch (CacheException cacheException) {
				throw new DataRetrievalFailureException("AuthorityResourceCache failure: " + cacheException.getMessage(), cacheException);
			}
			if (element == null) {
				return null;
			} else {
				return (Integer) element.getValue();
			}
		} 
	
	//清空cache
	 public synchronized static void removeAllAuthorityResourceCache(){
		 authorityResourceCache.removeAll();
		 authorityResourceCache.clearStatistics();
		 authorityResourceCache.flush();
	}
	
	//删除cache
	public synchronized static void removeAuthorityResourceCache(Integer authorityId){
		authorityResourceCache.remove(authorityId);
	} 
	
	//ResourceCache========================================================================
	//放入cache
	 public synchronized static void putResourceCache(Integer resourceId, Resource resource){
		Element element=new Element(resourceId, resource);
		resourceCache.put(element);
	}
	
	//获取cache
	public synchronized static Resource getResourceCache(Integer resourceId){
			Element element = null;
			try {
				element =resourceCache.get(resourceId);
			} catch (CacheException cacheException) {
				throw new DataRetrievalFailureException("ResourceCache failure: " + cacheException.getMessage(), cacheException);
			}
			if (element == null) {
				return null;
			} else {
				return (Resource) element.getValue();
			}
		} 
	
	//清空cache
	 public synchronized static void removeAllResourceCache(){
		 resourceCache.removeAll();
		 resourceCache.clearStatistics();
		 resourceCache.flush();
	}
	
	//删除cache
	public synchronized static void removeResourceCache(Integer resourceId){
		resourceCache.remove(resourceId);
	}  
	
	@SuppressWarnings("unchecked")
	public synchronized static Collection<Resource> getAllCache(){
		Collection<Integer> resources;
		Collection<Resource> resclist = new ArrayList<Resource>();
		try {
			resources = resourceCache.getKeys();
		} catch (IllegalStateException e) {
			throw new IllegalStateException(e.getMessage(), e);
		} catch (CacheException e) {
			throw new UnsupportedOperationException(e.getMessage(), e);
		}
		for (Integer resPath:resources) {
			Resource rd = getResourceCache(resPath);
			resclist.add(rd);
		}
		//排一下序,让/**这种大的在前面提前返回，否则会出现权限不够
		Collections.sort((ArrayList)resclist,new Comparator<Resource>(){
		   public int compare(Resource s1, Resource s2) {
			    if(s1.getOrderIndex()!=s2.getOrderIndex()){
			     return s1.getOrderIndex()-s2.getOrderIndex();
			    }
			    return 0;
		   }
		  });
		//System.out.println("----List:"+resclist);
		return resclist;
	}

}
