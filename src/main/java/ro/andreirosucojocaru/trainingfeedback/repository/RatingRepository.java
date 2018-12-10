package ro.andreirosucojocaru.trainingfeedback.repository;

import org.springframework.data.repository.CrudRepository;
import ro.andreirosucojocaru.trainingfeedback.domain.Rating;

import javax.transaction.Transactional;

@Transactional
public interface RatingRepository extends CrudRepository<Rating, Long> {
}
