package ro.andreirosucojocaru.trainingfeedback.repository;

import org.springframework.data.repository.CrudRepository;
import ro.andreirosucojocaru.trainingfeedback.domain.Schedule;

import javax.transaction.Transactional;

@Transactional
public interface ScheduleRepository extends CrudRepository<Schedule, Long> {
}
