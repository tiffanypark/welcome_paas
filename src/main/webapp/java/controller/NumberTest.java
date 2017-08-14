package controller;

import junit.framework.TestCase;
import controller.Number;

public class NumberTest extends TestCase {

	public void testNumberInt(){
		Number num = new Number();
		assertEquals(0, num.getValue());
	}
	
	public void testAdd(){
		Number num = new Number();
		assertEquals(10, num.add(10));
	}
	
	
	
}
