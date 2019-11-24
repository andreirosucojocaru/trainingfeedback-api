package ro.andreirosucojocaru.trainingfeedback.repository;

import org.springframework.data.repository.CrudRepository;
import ro.andreirosucojocaru.trainingfeedback.domain.Training;

import javax.transaction.Transactional;

@Transactional
public interface TrainingRepository extends CrudRepository<Training, Long> {
}
