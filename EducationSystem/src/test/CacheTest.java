package test;

import java.util.HashMap;
import java.util.Map;

public class CacheTest {
	public static void testSpike() {
		print("最大的内存为：" + Runtime.getRuntime().maxMemory() / 1024);
		print("总的内存为：" + Runtime.getRuntime().totalMemory() / 1024);
		print("==================================");
		long currMemory = Runtime.getRuntime().freeMemory();
		print("目前可用的内存为：" + currMemory / 1024);
		print("==================================");
		Map<String, MockBean> cache = new HashMap<String, MockBean>();
		for (int i = 0; i < 500000; i++) {
			MockBean bean = new MockBean();
			bean.setId(i);
			bean.setName("jerry" + i);
			bean.setValue(i + "jerry");
			cache.put(String.valueOf(i), bean);
			long tempMemory = Runtime.getRuntime().freeMemory();
			if ((currMemory - tempMemory) / 1024 == 1024) {
				print("此时可用的内存为：" + tempMemory / 1024);
				print("此时缓存了：" + i + "个对象");
				break;
			}
		}
		print("==================================");
		cache.clear();
		long tempMemory = Runtime.getRuntime().freeMemory();
		print("目前可用的内存为：" + tempMemory / 1024);
		print("消耗的内存为：" + (currMemory - tempMemory) / 1024);
		print("==================================");
		Runtime.getRuntime().gc();
		tempMemory = Runtime.getRuntime().freeMemory();
		print("目前可用的内存为：" + tempMemory / 1024);
		print("消耗的内存为：" + (currMemory - tempMemory) / 1024);
	}

	private static void print(String msg) {
		System.out.println(msg);
	}
	
	public static void main(String[] args) {
		CacheTest.testSpike();
	}
}
