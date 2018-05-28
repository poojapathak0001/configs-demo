package org.demo.exclude_resources_demo;

import static org.junit.Assert.*;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import org.junit.Test;

public class App2Test {

	Properties prop = new Properties();
	InputStream input = null;
	
	@Test
	public void test() {
		
			try {
				input = new FileInputStream("./src/main/resources/config.properties");
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// load a properties file
			try {
				prop.load(input);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// get the property value and print it out
			assertEquals("localhost", prop.getProperty("database"));
			assertEquals("pooh", prop.getProperty("dbuser"));
			assertEquals("password", prop.getProperty("dbpassword"));

		
	}

}
