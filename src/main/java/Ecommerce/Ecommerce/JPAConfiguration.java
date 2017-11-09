package Ecommerce.Ecommerce;



import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class JPAConfiguration {
	
	@Bean
	public void entityManagerFactory() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setUsername("root");
		dataSource.setPassword("root");
		dataSource.setUrl("jdbc:mysql://localhost/ecommerce");
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		
	}

}
