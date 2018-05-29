package org.demo.exclude_resources_demo;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
//import java.util.Scanner;
public class App2 {
  public static void main(String[] args) {

	Properties prop = new Properties();
	InputStream input = null;
	//Scanner sc = new Scanner(System.in);
	try {

		input = new FileInputStream("\\D:\\config\\config.properties");
		//System.out.println(sc.next());
		// load a properties file
		prop.load(input);

		// get the property value and print it out
		System.out.println("Printing property values");
		System.out.println(prop.getProperty("database"));
		System.out.println(prop.getProperty("dbuser"));
		System.out.println(prop.getProperty("dbpassword"));

	} catch (IOException ex) {
		ex.printStackTrace();
	} finally {
		if (input != null) {
			try {
				input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

  }
}