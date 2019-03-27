package net.newglobe.shiro;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.web.filter.authz.AuthorizationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.newglobe.app.model.SysAccount;
import net.newglobe.app.model.SysPower;

public class URLFilter extends AuthorizationFilter {

    @SuppressWarnings("unused")
    private Logger logger = LoggerFactory.getLogger(URLFilter.class);

    @Override
    protected boolean isAccessAllowed(ServletRequest request,
                                      ServletResponse response, Object paramObject)
            throws Exception {
    	
        String requestURI = getPathWithinApplication(request);
        HttpServletRequest httpServletRequest = (HttpServletRequest)request;
        SysAccount sysAccount = (SysAccount)httpServletRequest.getSession().getAttribute("account");
        if(sysAccount==null){
        	return true;
        }
        List<SysPower> urls =sysAccount.getPowers();
        return matchPower(requestURI, urls, request);
    }

    private boolean matchURL(String url,SysPower power){
        if(power.getUrl()==null)  return false;
        String [] powerUrls = null;
        if(power.getUrl().indexOf(";") > 0){
            powerUrls = power.getUrl().split(";") ;
        }else{
            powerUrls = new String[1];
            powerUrls[0] = power.getUrl();
        }
        for (String powerUrl : powerUrls) {
            if(powerUrl.equals(url)){
                return true;
            }
        }
        return false;
    }

    private boolean matchPower(String url,List<SysPower> urls, ServletRequest paramServletRequest){
        if(url.equals("/") || url.equals("/header") || url.equals("/footer") || url.equals("/index") || url.equals("/login")){
            return true;
        }
        for (SysPower jfqPower : urls) {
            if( matchURL(url, jfqPower)) {
            	paramServletRequest.setAttribute("pid", jfqPower.getParentId());
            	paramServletRequest.setAttribute("id", jfqPower.getId());
            	return true;
            }
        }
        return false;
    }

//    @SuppressWarnings("unchecked")
//    private List<SysPower> getAccountPowers(HttpServletRequest request){
//        HttpSession session = request.getSession();
//        SysUser user = (SysUser) SecurityUtils.getSubject().getPrincipal();
//        List<SysPower> powers =(List<SysPower>) session.getAttribute("powers");
//        if(powers==null){
//            if(user.isRoot()!=null && user.isRoot())
//                powers=powerService.getPowerList(new SysPower());
//            else{
//                powers = powerService.getAccountPowers(user.getId());
//            }
//            session.setAttribute("powers", powers);
//        }
//        return powers;
//    }
}
