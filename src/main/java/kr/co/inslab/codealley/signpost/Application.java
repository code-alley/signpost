package kr.co.inslab.codealley.signpost;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import kr.co.inslab.codealley.signpost.service.GroupService;

@Configuration
@ComponentScan
@EnableAutoConfiguration
public class Application extends WebMvcConfigurerAdapter {
	
	@Value("${stringer.domain}")
	private String domain;
	
	@Autowired
	private GroupService groupService;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new CustomInterceptor(domain, groupService));
		//registry.addInterceptor(new CustomInterceptor()).addPathPatterns("/main");
	}

	public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}