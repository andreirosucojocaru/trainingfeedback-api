package ro.andreirosucojocaru.trainingfeedback.repository;

import org.springframework.data.repository.CrudRepository;
import ro.andreirosucojocaru.trainingfeedback.domain.CostType;

import javax.transaction.Transactional;

@Transactional
public interface CostTypeRepository extends CrudRepository<CostType, Long> {
}
