package com.rise;

import org.junit.*;

public class Demotest {
    @Test
    public void contextLoads() {
        System.out.println("test");
    }

    @Test
    public void errorTest(){
        for(int i = 0; i < 10; i++){
            int n = 10/i;
            System.out.println(n);
        }
    }

    @Test
    public void add(){
        int a = 2;
        int n = 3;
        int result = 0;
        for(int i = 1; i <= 3; i++){
            n = n - 1;
            result = i*a*(10^n) + result;

        }
        System.out.println(result);
    }

    @BeforeClass
    public static void setUpBeforeClass() {
        System.out.println("Set up before class");
    }

    @Before
    public void setUp() throws Exception {
        System.out.println("Set up");
    }

    @Test
    public void testMathPow() {
        System.out.println("Test Math.pow");
        Assert.assertEquals(4.0, Math.pow(2.0, 2.0), 0.0);
    }

    @Test
    public void testMathMin() {
        System.out.println("Test Math.min");
        Assert.assertEquals(2.0, Math.min(2.0, 4.0), 0.0);
    }

    // 期望此方法抛出NullPointerException异常
    @Test(expected = NullPointerException.class)
    public void testException() {
        System.out.println("Test exception");
        Object obj = null;
        obj.toString();
    }

    // 忽略此测试方法
    @Ignore
    @Test
    public void testMathMax() {
        Assert.fail("没有实现");
    }


    @After
    public void tearDown() throws Exception {
        System.out.println("Tear down");
    }

    @AfterClass
    public static void tearDownAfterClass() {
        System.out.println("Tear down After class");
    }
}
