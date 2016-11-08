package action;

import dao.TeachDao;
import model.Teach;

public class TeachAction {

	public static boolean reduceChoose(Teach teach) {
		teach.setChoose(teach.getChoose() - 1);
		return TeachDao.updateTeach(teach);
	}

	public static boolean reduceChoose(int teach) {
		return reduceChoose(Teach.searchTeach(teach));
	}
}
