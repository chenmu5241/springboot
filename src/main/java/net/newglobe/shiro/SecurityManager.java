package net.newglobe.shiro;

import org.apache.shiro.mgt.RememberMeManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SessionKey;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SubjectContext;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;

/**
 * 主要为了解决shiro莫名其妙的UnknownSessionException的问题
 * @author Administrator
 *
 */
public class SecurityManager extends DefaultWebSecurityManager{
	
	@Override
    protected PrincipalCollection getRememberedIdentity(SubjectContext subjectContext) {
        RememberMeManager rmm = getRememberMeManager();
        if (rmm != null) {
            try {
                return rmm.getRememberedPrincipals(subjectContext);
            } catch (Exception e) {
            }
        }
        return null;
    }
	
	@Override
    protected Session resolveContextSession(SubjectContext context)  {
		try {
	        SessionKey key = getSessionKey(context);
	        if (key != null) {
	            return getSession(key);
	        }
		} catch (Exception e) {
		}
        return null;
    }
}
