package Ecommerce.Ecommerce;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class ConfiguracaoMVC extends WebMvcConfigurerAdapter{

		@Override
		public void addResourceHandlers(ResourceHandlerRegistry registry) {
			registry.addResourceHandler("/imagens/*.jpg").addResourceLocations("file:///Users/Rodrigo/Pictures/imagens/");
			registry.addResourceHandler("api/imagens/*.jpg").addResourceLocations("file:///Users/Rodrigo/Pictures/imagens/");
		}
		
}

