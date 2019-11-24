package ro.andreirosucojocaru.trainingfeedback.repository;

import org.springframework.data.repository.CrudRepository;
import ro.andreirosucojocaru.trainingfeedback.domain.Frequency;

import javax.transaction.Transactional;

@Transactional
public interface FrequencyRepository extends CrudRepository<Frequency, Long> {
}
