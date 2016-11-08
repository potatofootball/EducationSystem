package listener;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import model.Student;

/**
 * Application Lifecycle Listener implementation class QueueListener
 *
 */
@WebListener
public class QueueListener implements ServletContextListener {

	private static Map<Student, Long> InQueueMap = new HashMap<Student, Long>();
	private static List<Student> OutQueueList = new ArrayList<Student>();

	/**
	 * Default constructor.
	 */
	public QueueListener() {
	}

	public static Map<Student, Long> getInQueueMap() {
		return InQueueMap;
	}

	public static boolean addInQueueStudent(Student s) {
		if (InQueueMap.size() >= 250) {
			return false;
		} else {
			if (!InQueueMap.containsKey(s)) {
				InQueueMap.put(s, new Date().getTime());
			}
			return true;
		}
	}

	public static List<Student> getOutQueueMap() {
		return OutQueueList;
	}

	public static boolean addOutQueueStudent(Student s) {
		if (InQueueMap.containsKey(s)) {
			return false;
		} else {
			if (!OutQueueList.contains(s)) {
				OutQueueList.add(s);
			}
			return true;
		}
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent arg0) {
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent arg0) {
	}

}
