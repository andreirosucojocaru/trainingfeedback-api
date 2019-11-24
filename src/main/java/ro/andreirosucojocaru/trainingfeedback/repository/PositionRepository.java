package ro.andreirosucojocaru.trainingfeedback.repository;

import org.springframework.data.repository.CrudRepository;
import ro.andreirosucojocaru.trainingfeedback.domain.Position;

import javax.transaction.Transactional;

@Transactional
public interface PositionRepository extends CrudRepository<Position, Long> {
}
