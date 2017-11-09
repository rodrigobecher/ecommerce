package Ecommerce.Ecommerce;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
public class ConfiguracaoMVC extends WebMvcConfigurerAdapter{

		@Override
		public void addResourceHandlers(ResourceHandlerRegistry registry) {
			registry.addResourceHandler("imagens/*.jpg").addResourceLocations("file:///Users/rodrigo/Pictures/imagens/");
						
		}
		@Bean
		public InternalResourceViewResolver internalResourceViewResolver() {
			InternalResourceViewResolver resolver = new InternalResourceViewResolver();
			resolver.setPrefix("/WEB-INF/jsp/");
			resolver.setSuffix(".jsp");
			resolver.setExposedContextBeanNames("carrinhoCompras");
			
			return resolver;
		}
		@Bean
		public RestTemplate restTemplate() {
			return new RestTemplate();
		}
		
		@Override
		public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
			configurer.enable();
		}
		
}

