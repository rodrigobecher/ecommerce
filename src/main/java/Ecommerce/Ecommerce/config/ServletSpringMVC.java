package Ecommerce.Ecommerce.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import Ecommerce.Ecommerce.ConfiguracaoMVC;
import Ecommerce.Ecommerce.JPAConfiguration;

public class ServletSpringMVC extends AbstractAnnotationConfigDispatcherServletInitializer {
	
	@Override
	protected Class<?> [] getRootConfigClasses(){
		return new Class[] {SecurityConfiguration.class, ConfiguracaoMVC.class, JPAConfiguration.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}
}
