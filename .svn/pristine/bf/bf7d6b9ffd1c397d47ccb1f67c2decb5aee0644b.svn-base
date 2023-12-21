package kr.or.ddit.appointments.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.appointments.dao.AppointmentsDAO;
import kr.or.ddit.appointments.vo.AppointmentsVO;

@Service
public class AppointmentsServiceImpl implements AppointmentsService {
	
	@Inject
	private AppointmentsDAO appDAO;
	
	@Override
	public boolean createAppointments(List<AppointmentsVO> appointmentsList) {
		int cnt = 0;
		for(AppointmentsVO appointment : appointmentsList) {
			if(appointment.getAppNo() == null && appointment.getNewDep() == "" 
					&& appointment.getNewPo() == "" && appointment.getAppEmp() == "") {
				return false;
			}
			cnt += appDAO.insertAppointments(appointment);
		}
		return cnt > 0;
	}

}
